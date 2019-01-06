# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pomo
pkgver=0.6.0
pkgrel=2
epoch=
pkgdesc="Pomodoro CLI"
arch=(x86_64)
url="https://kevinschoon.github.io/pomo"
license=('MIT')
makedepends=(go go-bindata dep)
source=("https://github.com/kevinschoon/$pkgname/archive/$pkgver.tar.gz")

prepare() {
	mkdir -p gopath/src/github.com/kevinschoon
	ln -rTsf $pkgname-$pkgver gopath/src/github.com/kevinschoon/$pkgname
}

build() {
	export GOPATH="$srcdir"/gopath
	cd "gopath/src/github.com/kevinschoon/$pkgname"
	dep ensure
	make release-linux
}

package() {
	cd "gopath/src/github.com/kevinschoon/$pkgname"
	install -d "${pkgdir}/usr/bin"
	mv bin/pomo-UNKNOWN-linux-amd64 bin/pomo
	install bin/pomo "${pkgdir}/usr/bin"
}

md5sums=('e9762a4fdaa5ae83a1ccedffea9eb5cd')
