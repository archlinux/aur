# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=vpcs
pkgver=0.8.4
pkgrel=1
pkgdesc="Simple virtual PC simulator"
arch=('i686' 'x86_64')
url="https://github.com/GNS3/vpcs"
license=('BSD')
makedepends=('make' 'gcc' 'git')
source=("https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2b816f8943cddc83f450812d3969da22e97314208221a23df9658887aea5a587')

build(){
   cd "${srcdir}/${pkgname}-${pkgver}/src"

   ./mk.sh $(getconf LONG_BIT)
}

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" ${pkgdir}/usr/bin/${pkgname}
   install -Dvm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   install -dm755 "$pkgdir/usr/share/man/man1/"
   gzip "${srcdir}/${pkgname}-${pkgver}/man/vpcs.1" -cv --best > "$pkgdir/usr/share/man/man1/vpcs.1.gz"
}
