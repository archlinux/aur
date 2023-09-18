# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=vpcs
pkgver=0.8.3
pkgrel=1
pkgdesc="Simple virtual PC simulator"
arch=('i686' 'x86_64')
url="https://github.com/GNS3/vpcs"
license=('BSD')
makedepends=('make' 'gcc' 'git')
source=("https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('73018c923fdb8bbd7d76ddf4877bb7b3babbabed014f409f6b78a2e2b0a33da7')

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
