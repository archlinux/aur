# Maintainer: Bryn Edwards <bryn@protonmail.ch>

pkgname=antibody
pkgver=3.7.0
pkgrel=1
pkgdesc="A shell plugin manager."
arch=('i686' 'x86_64')
url="https://getantibody.github.io/"
license=('MIT')
makedepends=('go' 'dep')
source=("https://github.com/getantibody/antibody/archive/v${pkgver}.tar.gz")
sha256sums=('750adac224b19a0f4ef8429219f0b53daba3a95c1cbff887678474c1a33c71dd')
_repodir=(".go/src")

prepare() {
	export GOPATH="$srcdir/.go"
	mkdir -p "$srcdir/$_repodir"
	ln -snf "$srcdir/$pkgname-$pkgver" \
          "$srcdir/$_repodir/$pkgname"
	cd "$srcdir/$_repodir/$pkgname"
	sed -i "24s/dev/$pkgver/" "main.go"
	dep ensure
}

build() {
	export GOPATH="$srcdir/.go"
	cd "$srcdir/$_repodir/$pkgname"
	make build
}

# check() {
# 	export GOPATH="$srcdir/.go"
# 	cd "$srcdir/$_repodir/$pkgname"
# 	make test
# }

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
