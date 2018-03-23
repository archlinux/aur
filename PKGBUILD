# Maintainer: taij33n <bwbuiz@gmail.com>
pkgname=picolisp      
pkgver=18.3.23
pkgrel=1
pkgdesc="Fast and tiny 64-bit Lisp interpreter: OO, dynamic and functional (database, prolog, coroutines)."
url="http://www.picolisp.com"
arch=('x86_64')
license=('MIT')
depends=('bash' 'openssl')
optdepends=('jre: for picolisp ersatz.jar')
makedepends=('make' 'git' 'gcc')
_vendor="github.com/taij33n"
source=("git+https://$_vendor/$pkgname.git#tag=v$pkgver"
        "mkAsm")
md5sums=("SKIP" 
         "SKIP")
install=$pkgname.install

build() {
  # build tools first
  cd "${srcdir}/${pkgname}/src"
  make tools gate
  make clean
 
  # build the 64bit version
  cd "${srcdir}/${pkgname}/src64"
  # real 64-bit env
  make 
  make clean
}

package() {
  install -d -m755 "${pkgdir}/usr/lib/picolisp"
  cp -a ${srcdir}/${pkgname}/* ${pkgdir}/usr/lib/picolisp/
}
