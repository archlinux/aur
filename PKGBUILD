pkgname=chicken-test-new-egg
_name=test-new-egg
pkgver=1.0.4
pkgrel=2
pkgdesc='Chicken Scheme A tool to test new eggs before they are added to the official CHICKEN repository'
arch=('x86_64')
license=('BSD')
depends=("chicken" "chicken-henrietta-cache" "chicken-salmonella" "chicken-srfi-1" "chicken-openssl")
url='http://wiki.call-cc.org/eggref/5/test-new-egg'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  find ${srcdir} -maxdepth 1 -type f | xargs -I {} cp {} ${pkgdir}/usr/lib/chicken/11

  install -d ${pkgdir}/usr/bin
  cp -a ${srcdir}/bin/* ${pkgdir}/usr/bin
}

