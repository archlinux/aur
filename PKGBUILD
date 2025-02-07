# Maintainer: John Sanpe <sanpeqf@gmail.com>
pkgname=sdbd-git
_gitname=sdbd
pkgver=r17.905a1ab
pkgrel=1.2
pkgdesc="Simple Debug Bridge Daemo"
arch=(any)
url="https://github.com/openbfdev/sdbd.git"
branch="devel"
license=('GPL')
depends=('bfenv-devel-git' 'bfdev-devel-git')
makedepends=('git' 'cmake' 'gcc' 'fakeroot' 'bfenv-devel-git' 'bfdev-devel-git')
source=("${_gitname}::git+${url}#branch=${branch}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd ${_gitname%-git}
	make
}

package() {
	cd ${_gitname%-git}
	install -Dm755 sdbd "$pkgdir/usr/bin"
}
