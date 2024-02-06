# Maintainer: Clarence <chengruichen3@gmail.com>
pkgname=aerc-digestion-git
pkgver=r10.db7d0c4
pkgrel=1
pkgdesc="Aerc mail filter for plain text digests (Mailman) "
arch=('x86_64')
url="https://git.dominic-ricottone.com/~dricottone/digestion"
license=('custom')
groups=()
depends=()
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
source=("git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/digestion"

#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/digestion"
	make build
}

package() {
	cd "$srcdir/digestion"
	mkdir -p "$pkgdir/usr/lib/aerc/filters"
	INSTALL_DIR=$pkgdir/usr/lib/aerc/filters make install
}
