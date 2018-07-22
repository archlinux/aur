# Maintainer: Rohit Goswami <rohit.goswami@aol.com>
pkgname=pp-git
_pkgname=pp
pkgver=r174.7e2866f
pkgrel=1
pkgdesc="PP is a text preprocessor designed for Pandoc (and more generally Markdown and reStructuredText)."
arch=('x86_64')
url="http://cdsoft.fr/pp"
license=('GPL')
groups=()
depends=('gmp')
makedepends=('git' 'stack') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "pp")
replaces=()
backup=()
options=()
source=("${_pkgname}::git+https://github.com/CDSoft/pp.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${_pkgname}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	stack install --local-bin-path ./bin
    install -Dm755 ./bin/pp "$pkgdir/usr/bin/pandoc-pp"
}
