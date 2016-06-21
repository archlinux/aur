pkgname=go-makepkg
pkgver=20160621
pkgrel=1
pkgdesc="Tool for fast packaging golang code"
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/seletskiy/go-makepkg'
makedepends=('go' 'git')

source=(
	"git://github.com/seletskiy/go-makepkg.git"
)

md5sums=(
	'SKIP'
)

backup=(
)

pkgver() {
	cd "$srcdir/$pkgname"
	git log -1 --format="%cd" --date=short | sed s/-//g
}

build() {
	cd "$srcdir/$pkgname"

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/$pkgname" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/$pkgname/"
	ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

	echo "Running 'go get'..."
	go get
}

package() {
	install -DT "$srcdir/.go/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
