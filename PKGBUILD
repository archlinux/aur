# Maintainer: Antoine Pierlot-Garcin <antoine@bokbox.com>
pkgname=debsig-verify-git
pkgver=0.13.r8.6104eef
pkgrel=1
pkgdesc="Debian package signature verification tool"
arch=('x86_64' 'i686' 'arm')
url="https://anonscm.debian.org/cgit/dpkg/debsig-verify.git"
license=('GPL')
groups=()
depends=('dpkg' 'libxmltok')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('debsig-verify::git+http://anonscm.debian.org/cgit/dpkg/debsig-verify.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

## Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
