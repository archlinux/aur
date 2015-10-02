# Maintainer: Dan Schaper <dschaper at ganymeade dot com>

pkgname=mlat-client-git
pkgver=0.2.4.r1.gfc43b04
pkgrel=1
pkgdesc="Mode S multilateration client. Mutability git."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/mutability/mlat-client"
license=('GPL')
depends=('python')
makedepends=('git' 'python')
source=(${pkgname}::git://github.com/mutability/mlat-client.git)
md5sums=('SKIP')
changelog=($pkgname.changelog)
provides=('mlat-client' 'fa-mlat-client')
conflicts=('mlat-client' 'fa-mlat-client')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./setup.py build
}

package(){
  cd "${pkgname}"
  ./setup.py install --prefix=${pkgdir}/usr
  install -Dm755 -t "${pkgdir}/usr/lib/piaware/helpers/" fa-mlat-client
  install -Dm755 -t "${pkgdir}/usr/bin/" mlat-client
  rm -f "${pkgdir}/usr/bin/fa-mlat-client"
} 
