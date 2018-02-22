# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=frivpn-git
pkgver=61.7596215
pkgrel=1
pkgdesc="A multi-threaded OpenVPN client"
arch=('x86_64')
url="https://github.com/znuh/frivpn"
license=('GPL2')
makedepends=('cmake' 'git' 'lua' 'openssl' 'lzo')
depends=('lua' 'lua-posix' 'lua-luaossl' 'lua-cqueues' 'openssl' 'lzo')
source=("git+https://github.com/znuh/frivpn.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/frivpn"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "${srcdir}/frivpn/build"
}

build() {
	cd "${srcdir}/frivpn/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
	cd "${srcdir}/frivpn/build"
	make DESTDIR=${pkgdir} install
}
