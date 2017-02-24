pkgname=umr-git
epoch=1
pkgver=r19.ccd0ec4
pkgrel=1
pkgdesc='userspace debugging and diagnostic tool for AMD GPUs using the AMDGPU kernel driver'
arch=('i686' 'x86_64')
url='https://cgit.freedesktop.org/amd/umr/'
license=('GPL3')
#depends=('ncurses')
makedepends=('git' 'cmake')
provides=('umr')
conflicts=('umr')
source=('git://anongit.freedesktop.org/amd/umr')
sha256sums=('SKIP')
#options=(debug "!strip")

pkgver() {
	cd umr
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd umr
}

build() {
	cd umr
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release .
}

package() {
	cd umr
	make DESTDIR="$pkgdir" install
}
