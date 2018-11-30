# Maintainer: Bryn Edwards <bryn@protonmail.ch>

pkgname=antibody
pkgver=4.0.2
pkgrel=1
pkgdesc="A shell plugin manager."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://getantibody.github.io/"
license=('MIT')
depends=('git')
makedepends=('go')
source=("https://github.com/getantibody/antibody/archive/v${pkgver}.tar.gz")
sha256sums=('3f0a4d0d877189545127ea3b5ccf5370af9dd79a0fbae1d4c8e8cf1dac1afdc6')
_repodir=(".go/src")

prepare() {
	export GOPATH="$srcdir/.go"
	mkdir -p "$srcdir/$_repodir"
	ln -snf "$srcdir/$pkgname-$pkgver" \
          "$srcdir/$_repodir/$pkgname"
	cd "$srcdir/$_repodir/$pkgname"
	sed -i "25s/dev/$pkgver/" "main.go"
}

build() {
	export GOPATH="$srcdir/.go"
	cd "$srcdir/$_repodir/$pkgname"
	make build
}

check() {
	export GOPATH="$srcdir/.go"
	cd "$srcdir/$_repodir/$pkgname"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
