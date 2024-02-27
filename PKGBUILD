# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh-git
pkgver=2.0.8.r1.g86b95ed
pkgrel=1
epoch=1
pkgdesc='Version Control System for $HOME that manages multiple Git repositories'
arch=(any)
url="https://github.com/RichiH/${pkgname%-git}"
license=(GPL-2.0-only)
depends=(git)
makedepends=(ruby-ronn)
checkdepends=(perl
              perl-shell-command
              perl-test-most)
optdepends=('myrepos: manage multiple vcsh repos through mr')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	./bootstrap.sh
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/-\(alpha\|beta\|rc\)\./\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	./configure --prefix /usr
	make
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
