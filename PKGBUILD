# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_gourl="bitbucket.org/ambrevar/$pkgname"
pkgname=demlo
pkgver=2.0
pkgrel=1
pkgdesc="A dynamic and extensible music library organizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.org/$pkgname/"
license=("MIT")
depends=("ffmpeg" "lua51" "taglib")
makedepends=("go")
optdepends=("chromaprint: Internet tagging")

build() {
	GOPATH="$srcdir" go get -fix -v -x "$_gourl"
}

check() {
	GOPATH="$GOPATH:$srcdir" go test -v -x "$_gourl"
}

package() {
	cd "$srcdir"
	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "src/$_gourl/${pkgname}rc" "$pkgdir/usr/share/$pkgname/${pkgname}rc"

	cd "src/$_gourl"
	for i in scripts/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
	done
}
