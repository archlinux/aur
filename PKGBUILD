#!/hint/bash -e
# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>

pkgname=mlat-client-git
pkgver=0.2.12.r0.g16924db
pkgrel=1
pkgdesc="Mode S multilateration client by Mutability"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mutability/${pkgname%-git}"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}" "fa-${pkgname%-git}")
conflicts=("${pkgname%-git}" "fa-${pkgname%-git}")
changelog="$pkgname.changelog"
source=("${pkgname%-git}::git+$url.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  ./setup.py build
}

package() {
  cd "${pkgname%-git}"
  ./setup.py install --prefix="${pkgdir}/usr"
  install -Dm755 -t "${pkgdir}/usr/lib/piaware/helpers/" fa-mlat-client
  install -Dm755 -t "${pkgdir}/usr/bin/" mlat-client
  rm -f "${pkgdir}/usr/bin/fa-mlat-client"
}
