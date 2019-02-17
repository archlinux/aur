# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gotop-git
_pkgname=${pkgname%-git}
pkgver=2.0.2.r0.g0ed7e58
pkgrel=1
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64)
url='https://github.com/cjbassi/gotop'
license=(AGPL3)
makedepends=("go>=1.11.0" "git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+https://github.com/cjbassi/gotop")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	go build
}

package() {
	install -Dm755 "$srcdir/$pkgname/gotop" "$pkgdir/usr/bin/gotop"
}
