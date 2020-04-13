# Maintainer: Nicholas Tay <nkt@outlook.kr>

pkgname=i3-ws-nick-git
_pkgname=${pkgname%-git}
pkgver=dac6b63
pkgrel=1
pkgdesc='Multi-monitor workspace helper for i3-wm (nicholastay fork)'
arch=('x86_64')
license=('custom')
url='https://github.com/nicholastay/i3-ws'
depends=('jsoncpp' 'libsigc++')
makedepends=('git' 'cmake')
sha256sums=('SKIP')
source=("${_pkgname}::git+${url}")

prepare() {
	# git submodule (i3ipc++)
	cd "${_pkgname}"
	git submodule update --init --recursive
}

pkgver() {
	cd "${_pkgname}"
	echo "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cmake '.'
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
