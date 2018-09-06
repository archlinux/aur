# Maintainer: Frank Tang <roadtang@gmail.com>
pkgname=saba-git
pkgver=r339.21d1805
pkgrel=1
pkgdesc="OpenGL Viewer (OBJ PMD PMX)"
arch=(any)
url="https://github.com/benikabocha/saba"
license=('GPL')
groups=()
depends=(glfw bullet)
makedepends=(git) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('saba::git+https://github.com/benikabocha/saba.git' 'saba.patch')
noextract=()
md5sums=('SKIP' 'SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"


# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake  -DSABA_INSTALL=on  -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#	make -k check
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
