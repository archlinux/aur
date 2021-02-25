# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: lucke <lucke at o2 dot pl>
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Dmitry Korzhevin <dkorzhevin AT gmail DOT com>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: Tim Zebulla <amon at faumrahrer dot de>

_pkgname=weechat
pkgname=${_pkgname}-minimal-git
pkgver=2.7.125.gc29b45a0f
pkgrel=1
pkgdesc='Fast, light and extensible IRC client (curses UI). Development version.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://www.weechat.org/'
license=('GPL')

depends=('gnutls' 'ncurses' 'curl' 'zlib' 'libgcrypt' 'hicolor-icon-theme')
makedepends=(
	'git' 'source-highlight' 'cmake' 'pkg-config'
)
optdepends=(
	'perl' 'python' 'lua' 'tcl' 'ruby'
	'aspell' 'guile' 'python2' 'asciidoctor'
	'php' 'v8'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+https://github.com/${_pkgname}/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	mkdir -p "${srcdir}"/build
}

build() {
	cd "${srcdir}"/build
	cmake -Wno-dev ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_MAN=OFF \
		-DENABLE_DOC=OFF \
		-DENABLE_JAVASCRIPT=OFF \
		-DENABLE_PHP=OFF \
		-DENABLE_EXEC=OFF \
		-DENABLE_FIFO=OFF \
		-DENABLE_GUILE=OFF \
		-DENABLE_LUA=OFF \
		-DENABLE_PERL=OFF \
		-DENABLE_PYTHON=OFF \
		-DENABLE_RUBY=OFF \
		-DENABLE_TCL=OFF \
		-DENABLE_XFER=OFF \
		-DENABLE_LOGGER=OFF \
		-DENABLE_RELAY=OFF \
		-DENABLE_HEADLESS=OFF \
		-DENABLE_PYTHON2=OFF \
		-DENABLE_SPELL=OFF \
		-DENABLE_ENCHANT=OFF \
		-DENABLE_TESTS=OFF \
		-DENABLE_SCRIPT=OFF \
		-DENABLE_SCRIPTS=OFF \
		-DENABLE_TRIGGER=OFF
	make
}

package() {
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
