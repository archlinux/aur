# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gotop-git
_pkgname=${pkgname%-git}
pkgver=3.0.0.r7.g3a804eb
pkgrel=1
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64)
url='https://github.com/cjbassi/gotop'
license=(AGPL3)
makedepends=("go" "git")
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
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
		-mod vendor \
		.
}

package() {
	install -Dm755 "$srcdir/$pkgname/gotop" "$pkgdir/usr/bin/gotop"
}
