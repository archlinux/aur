# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>

pkgname=mlat-client-git
pkgver=0.2.10.r0.g59e3d57
pkgrel=1
pkgdesc="Mode S multilateration client. (by Mutability)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mutability/mlat-client"
license=('GPL')
depends=('python')
makedepends=('git')
source=("${pkgname}::git://github.com/mutability/mlat-client.git")
md5sums=('SKIP')
changelog=$pkgname.changelog
provides=('mlat-client' 'fa-mlat-client')
conflicts=('mlat-client' 'fa-mlat-client')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./setup.py build
}

package() {
  cd "${pkgname}"
  ./setup.py install --prefix="${pkgdir}/usr"
  install -Dm755 -t "${pkgdir}/usr/lib/piaware/helpers/" fa-mlat-client
  install -Dm755 -t "${pkgdir}/usr/bin/" mlat-client
  rm -f "${pkgdir}/usr/bin/fa-mlat-client"
}
