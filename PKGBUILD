# Maintainer: Igor Zibarev <zibarev.i@gmail.com>

pkgname=dotbro
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple yet effective dotfiles manager"
arch=('i686' 'x86_64')
url='https://github.com/hypnoglow/dotbro'
license=('MIT')
provides=(${pkgname%-*}=$pkgver)

depends=(
)

makedepends=(
	'go'
	'git'
)

source=(
	"${pkgname}::git+https://github.com/hypnoglow/dotbro#tag=v${pkgver}"
)

md5sums=(
	'SKIP'
)

backup=(
)

prepare() {
	echo "Fetching build dependencies..."
	mkdir -p "$srcdir/go"
	GOPATH="$srcdir/go" go get -fix github.com/hypnoglow/dotbro
}

build() {
	echo "Building..."
	cd "$srcdir/${pkgname}"
	GOPATH="$srcdir/go" go build
}

package() {
	cd "$srcdir/${pkgname}"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
