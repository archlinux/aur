_gopkgname='github.com/McKael/madonctl'
pkgname=madonctl
pkgver=2.3.1
pkgrel=1
pkgdesc='CLI client for the Mastodon social network API'
arch=('x86_64')
url='https://github.com/McKael/madonctl'
license=('MIT')
makedepends=('go' 'git' 'dep')
source=("$pkgname-$pkgver.tar.gz::https://$_gopkgname/archive/v$pkgver.tar.gz")
sha256sums=('f97707a4f96b15a8331a0b3725a43c7717bf068bf9e6c5e885a13dd3016d5cf6')

prepare(){
	mkdir -p gopath/src/"$(dirname "$_gopkgname")"
	ln -rTsf "$pkgname-$pkgver" gopath/src/"$_gopkgname"
	export GOPATH="$srcdir"/gopath
	cd gopath/src/"$_gopkgname"
	dep init
	dep ensure
}

build() {
	export GOPATH="$srcdir"/gopath
	cd gopath/src/"$_gopkgname"
	go build -v .
}

check() {
	export GOPATH="$srcdir"/gopath
	cd gopath/src/"$_gopkgname"
	go test .
}

package() {
	install -Dm755 "$pkgname-$pkgver"/$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 "$pkgname-$pkgver"/LICENSE \
		"$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
