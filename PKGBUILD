# Maintainer: Matt Coffin <mcoffin13@gmail.com>

pkgname=git-branch-diff-git
pkgver=0.1.0.r0.e5038ec
pkgrel=1
pkgdesc="git branch-diff command"
arch=(any)
url="https://gitlab.com/mcoffin/git-branch-diff"
license=('GPL')
groups=()
depends=('bash')
makedepends=('git' 'scdoc') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://gitlab.com/mcoffin/git-branch-diff.git#branch=master")
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | tr -d 'v')"

	# Git, no tags available
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}
