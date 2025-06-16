<<<<<<< HEAD
# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='libutf8proc-git'
pkgver=2.4.0.1.r0.g0d22740
pkgrel=1
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
url='http://git.netsurf-browser.org/libutf8proc.git/'
license=('MIT')

makedepends=('git' 'netsurf-buildsystem-git')
provides=('libutf8proc')
conflicts=('libutf8proc')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libutf8proc.git')
sha256sums=('SKIP')

pkgver() {
	cd libutf8proc
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-\([0-9]\+\)-:.\1.r\2.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libutf8proc/Makefile
}

build() {
	make -C libutf8proc PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libutf8proc
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 LICENSE.md \
		"$pkgdir/usr/share/licenses/netsurf/libutf8proc"
=======
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="libutf8proc"
_so="2"
pkgname="${_basename}${_so}"
pkgver=2.8.0
pkgrel=1
pkgdesc="C library for processing UTF-8 encoded Unicode strings (so-version ${_so})"
arch=('i686' 'x86_64')
url="https://github.com/JuliaStrings/utf8proc"
license=('custom')
depends=('glibc')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0a60a79fe6f6d54e7d411facbfcc867a6e198608f2cd992490e46f04b1bcecc')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS}" LDFLAG_SHARED="${LDFLAGS} -shared"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make \
    prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib/${pkgname}" \
    includedir="${pkgdir}/usr/include/${pkgname}" \
    install

  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  cd "${pkgdir}/usr/lib/${pkgname}"
  for lib in *.so.*; do
    ln -sf "/usr/lib/${pkgname}/${lib}" "${pkgdir}/usr/lib/${lib}"
  done
>>>>>>> 9618023 (Initial build (2.8.0))
}
