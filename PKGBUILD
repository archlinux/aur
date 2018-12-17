# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=libdill-git
_pkgname=libdill
pkgver=2.13.r20.g5684026
pkgrel=1
pkgdesc='Structured concurrency in C'
arch=('i686' 'x86_64')
url='http://libdill.org/'
depends=('pkgconfig')
options=('!buildflags')
makedepends=('gcc')
license=('MIT')
source=("${_pkgname}::git+https://github.com/sustrik/libdill.git")

pkgver() {
	cd "${srcdir}/${_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

  ./autogen.sh
}

build() {
	cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr
  make
}

check() {
	cd "${srcdir}/${_pkgname}"

  # make check
}

package() {
	cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP')
