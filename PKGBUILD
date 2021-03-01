# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# PKGBUILD/install/wrapper all shamelessly ripped off from [community]/dwarffortress

pkgname=arcanefortune-bin
pkgver=0.3.0
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

sha512sums=('3245fc4869ab296106f3d5df119d3304dd3ded8fca229ddd1b52e993730e5a554710272143961175a46ff861ecbba4496620fc8d89cf56e0c0431e81a1ebe289'
            '0773b7a90dc0d4740c1696efa57ef419d8d14b0756d95da92a088c8772c390f8dcb0ccba702f332e497c45eada62aacd24cf7b40e11eb195d5c8b031fca72ffc')

package() {
  install -dm755 "${pkgdir}/opt"
  install -Dm755 arcane_fortune "${pkgdir}/usr/bin/arcane_fortune"
  cp -r "${srcdir}/arcane_fortune_v${pkgver//./_}" "${pkgdir}/opt/arcanefortune"
  find "${pkgdir}/opt/arcanefortune" -type d -exec chmod a+rx {} \;
  find "${pkgdir}/opt/arcanefortune" -type f -exec chmod a+r {} \;
  install -Dm644 "${srcdir}/arcane_fortune_v${pkgver//./_}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
