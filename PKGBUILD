# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=communi-desktop-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r2931.f15534d
pkgrel=2
pkgdesc="An IRC client for desktop environments."
arch=('x86_64' 'i686')
url=""
license=('GPL')
groups=()
depends=('qt5-declarative' 'libcommuni-git')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git://github.com/communi/communi-desktop.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
        git submodule update --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
        qmake
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
