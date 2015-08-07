# Maintainer: Dan Schaper <dschaper at ganymeade dot com>

pkgname=mlat-client-git
pkgver=0.2.3.r4.gca8cb6f
pkgrel=4
pkgdesc="Mode S multilateration client"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/mutability/mlat-client"
license=('GPL')
depends=('python')
makedepends=('git' 'python')
source=(${pkgname}::git://github.com/mutability/mlat-client.git)
md5sums=('SKIP')
changelog=($pkgname.changelog)
provides=('mlat-client' 'fa-mlat-client')

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
  install -d "${pkgdir}/usr/lib/piaware/helpers/"
  install -d "${pkgdir}/usr/bin/"
  install -Dm755 fa-mlat-client "${pkgdir}/usr/lib/piaware/helpers/"
  install -Dm755 mlat-client "${pkgdir}/usr/bin/"
  rm -f "${pkgdir}/usr/bin/fa-mlat-client"
} 
