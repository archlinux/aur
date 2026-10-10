# Maintainer: Your Name <youremail@domain.com>
pkgname=goboscript-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v3.2.1.r560.90da472
pkgrel=1
pkgdesc="goboscript is the Scratch compiler"
arch=('x86_64')
url="https://github.com/aspizu/goboscript"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'rust') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/aspizu/goboscript.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/goboscript"
}
