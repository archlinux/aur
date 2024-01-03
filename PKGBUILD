# Maintainer: Matt Coffin <mcoffin13@gmail.com>

pkgname=libscfg-git
_pkgver='branch=master'
pkgver=r10.e44023f
pkgrel=1
pkgdesc="A C library for scfg"
arch=(x86_64)
url="https://git.sr.ht/~emersion/libscfg"
license=('MIT')
groups=()
depends=()
makedepends=(git meson ninja) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=(libscfg)
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://git.sr.ht/~emersion/libscfg#${_pkgver}")
noextract=()
b2sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	# local _gitflags=(-C "$srcdir/${pkgname%-git}")
	# Git, no tags available
	# printf "r%s.%s" "$(git "${gitflags[@]}" rev-list --count HEAD)" "$(git -C "${gitflags[@]}" rev-parse --short HEAD)"
	# Git, tags available
	# printf "%s" "$(git -C "${gitflags[@]}" describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	cd "$srcdir/${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	return 0
}

build() {
	arch-meson \
		"$srcdir/${pkgname%-git}" \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

check() {
	return 0
}

package() {
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
