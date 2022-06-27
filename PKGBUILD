# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# PKGBUILD/install/wrapper all shamelessly ripped off from [community]/dwarffortress

pkgname=arcanefortune-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A game of empire building, diplomacy, conquest, construction, and deconstruction"
arch=('x86_64')
url="https://arcanefortune.com"
license=('AGPL3' 'CC BY-SA 4.0')
options=(!strip !emptydirs)
depends=('sh' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'ncurses' 'freetype2' 'gcc-libs' 'libjpeg6-turbo' 'libtiff' 'zlib')
provides=("${pkgname/-bin}")
conflicts=("${pkgname/-bin}")
install=arcanefortune.install
source=("${url}/releases/arcane_fortune_v${pkgver//./_}_linux.zip"
        arcane_fortune)

sha512sums=('018ca80ae7c4fb1638fc838695843596b03d1871c8a6d25d68dd723f2eabc346b65ce798ca101ee47ff312a5c8920c8e62991cf24ac5d5b1956afbf8deb294a8'
            '0773b7a90dc0d4740c1696efa57ef419d8d14b0756d95da92a088c8772c390f8dcb0ccba702f332e497c45eada62aacd24cf7b40e11eb195d5c8b031fca72ffc')

package() {
  install -dm755 "${pkgdir}/opt"
  install -Dm755 arcane_fortune "${pkgdir}/usr/bin/arcane_fortune"
  cp -r "${srcdir}/arcane_fortune_v${pkgver//./_}" "${pkgdir}/opt/arcanefortune"
  find "${pkgdir}/opt/arcanefortune" -type d -exec chmod a+rx {} \;
  find "${pkgdir}/opt/arcanefortune" -type f -exec chmod a+r {} \;
  install -Dm644 "${srcdir}/arcane_fortune_v${pkgver//./_}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
