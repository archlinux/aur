# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
_pkgname=gojsontoyaml
pkgname=${_pkgname}-git
pkgver=r3.6337f37
pkgrel=1
pkgdesc="Simple tool to convert json to yaml written in Go."
url="https://github.com/brancz/gojsontoyaml"
license=('MIT')
arch=('i686' 'x86_64')
optdepends=()
makedepends=('git' 'go')
source=("git+https://github.com/brancz/gojsontoyaml.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/src/github.com/brancz/gojsontoyaml"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf "$srcdir/src"
	mkdir -p "$srcdir/src/github.com/brancz"
	mv -T "$srcdir/gojsontoyaml" "$srcdir/src/github.com/brancz/gojsontoyaml"
}

build() {
	export GOPATH="$srcdir"
	cd "$GOPATH/src/github.com/brancz/gojsontoyaml"
	go build -o gojsontoyaml
}

package() {
	install -Dm755 "$GOPATH/src/github.com/brancz/gojsontoyaml/gojsontoyaml" -t "$pkgdir/usr/bin"
}
