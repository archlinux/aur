# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

_pkgname=ioport
pkgname=ioport-git
pkgver=r4.af4b1b5
pkgrel=1
pkgdesc="Direct access to I/O ports from the command line"
arch=('x86_64')
url="https://people.redhat.com/rjones/ioport/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
source=("${_pkgname}::git+git://git.annexia.org/ioport.git")
sha256sums=('SKIP')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
