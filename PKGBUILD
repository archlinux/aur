# Maintainer: Jesse R Codling <codling@umich.edu>
pkgname=openups-git
_pkgname="${pkgname%-git}"
pkgver=20240630.8c6db67
pkgrel=1
pkgdesc="Status and Configuration application for Mini-Box.com Open UPS, Open UPS 2 and NUC UPS"
arch=(x86_64)
url="https://github.com/mini-box/ups"
license=('LGPL')
depends=('libusb-compat')
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname%}")
conflicts=("${_pkgname%}")
source=(
	"ups::git+${url}.git"
)

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/ups"

	# Git, no tags available
	printf "%s.%s" "$(git log --date="format:%Y%m%d" --format="%ad" -n 1 HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/ups"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" .
}

build() {
	cd "$srcdir/ups"
	make
}

package() {
	cd "$srcdir/ups"
	make DESTDIR="$pkgdir" install
}
