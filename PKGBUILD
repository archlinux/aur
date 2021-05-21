# Maintainer: Jendrik <rua@jendrik.eu

pkgname=wiz-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r275.972cd9d
pkgrel=1
pkgdesc="A high-level assembly language for writing homebrew software and games on retro console platforms."
arch=('x86_64')
url="https://github.com/wiz-lang/wiz"
license=('MIT')
#groups=()
depends=(
	'gcc-libs'
)
makedepends=(
	'git'
)
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
#replaces=()
#backup=()
#options=()
#install=
source=('git+https://github.com/wiz-lang/wiz')
#noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
# https://wiki.archlinux.org/title/VCS_package_guidelines#VCS_sources
# If there are no tags then use number of revisions since beginning of the history: 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make -j8
}

# check() {
# 	cd "$srcdir/${pkgname%-git}"
# 	chmod +x tests/wiztests.sh
# 	make -j8 tests
# }

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
