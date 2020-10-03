# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# PKGBUILD/install/wrapper all shamelessly ripped off from [community]/dwarffortress

pkgname=arcanefortune-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A game of empire building, diplomacy, conquest, construction, and deconstruction"
arch=('x86_64')
url="https://arcanefortune.com"
license=('AGPL3' 'CC BY-SA 4.0')
options=(!strip !emptydirs)
depends=('sh')
provides=("${pkgname/-bin}")
conflicts=("${pkgname/-bin}")
install=arcanefortune.install
source=("${url}/releases/arcane_fortune_v${pkgver//./_}_linux.zip"
        arcane_fortune)

sha512sums=('639ca6e102af94281f9ee5fe3588ca7954b773fc41ca5a4d05db5abd4d72943d9380698ed3cc9313f05677016e2cf595d7f09c089bfb9172fec95de18f08c68b'
            '0773b7a90dc0d4740c1696efa57ef419d8d14b0756d95da92a088c8772c390f8dcb0ccba702f332e497c45eada62aacd24cf7b40e11eb195d5c8b031fca72ffc')

package() {
  install -dm755 "${pkgdir}/opt"
  install -Dm755 arcane_fortune "${pkgdir}/usr/bin/arcane_fortune"
  cp -r "${srcdir}/arcane_fortune_v${pkgver//./_}" "${pkgdir}/opt/arcanefortune"
  find "${pkgdir}/opt/arcanefortune" -type d -exec chmod a+rx {} \;
  find "${pkgdir}/opt/arcanefortune" -type f -exec chmod a+r {} \;
  install -Dm644 "${srcdir}/arcane_fortune_v${pkgver//./_}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
