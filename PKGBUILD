# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=libdill-git
pkgver=2.14.r19.g32d0e8b
pkgrel=1
pkgdesc='Structured concurrency in C'
arch=('i686' 'x86_64')
url='http://libdill.org/'
depends=('pkgconfig')
options=('!buildflags')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('gcc')
license=('MIT')
source=("${pkgname}::git+https://github.com/sustrik/libdill.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

  ./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname}"

  ./configure --prefix=/usr
  make
}

check() {
	cd "${srcdir}/${pkgname}"

  # make check
}

package() {
	cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
