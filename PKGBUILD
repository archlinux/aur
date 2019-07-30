# Maintainer: Antoine Pierlot-Garcin <antoine@bokbox.com>
pkgname=debsigs-git
pkgver=r96.05c081a
pkgrel=1
pkgdesc="toolset for cryptographically signing Debian packages"
arch=('any')
url="https://gitlab.com/debsigs/debsigs"
license=('GPL')
groups=()
depends=('perl')
makedepends=('git' 'perl') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('debsigs::git+https://gitlab.com/debsigs/debsigs.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

## Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	#patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	perl Makefile.PL
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
