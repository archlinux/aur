#!/hint/bash -e
# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>

pkgname=mlat-client-git
pkgver=0.2.10.r0.g59e3d57
pkgrel=2
pkgdesc="Mode S multilateration client. (by Mutability)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mutability/mlat-client"
license=('GPL3')
depends=('python')
makedepends=('git')
source=("${pkgname%-git}::git+${url}.git")
changelog="${pkgname}.changelog"
provides=("${pkgname%-git}" 'fa-mlat-client')
conflicts=("${pkgname%-git}" 'fa-mlat-client')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  ./setup.py build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  ./setup.py install --prefix="${pkgdir}/usr"
  install -Dm755 -t "${pkgdir}/usr/lib/piaware/helpers/" fa-mlat-client
  install -Dm755 -t "${pkgdir}/usr/bin/" mlat-client
  rm -f "${pkgdir}/usr/bin/fa-mlat-client"
}
