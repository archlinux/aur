# Maintainer: gcmalloc <gcmalloc@gmail.com>

pkgname=openrdap-client
pkgver=0.9.0
pkgrel=1
pkgdesc="OpenRDAP is an command line RDAP client implementation in Go."
url="https://www.openrdap.org/"
arch=("x86_64")
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/openrdap/rdap/archive/v$pkgver.tar.gz")
sha256sums=("44ce757b0a2a3a98613e9a620e85435c6ce7f8075334ef2a5fef96145d178f31")


prepare() {
	export GOPATH="${srcdir}"
	export PATH="$PATH:$GOPATH/bin"
	mkdir -p src/github.com/openrdap/
	mv "rdap-${pkgver}" src/github.com/openrdap/${pkgname}
}


build() {
	cd src/github.com/openrdap/"${pkgname}"
	go get ./...
	go build
}


package() {
	install -Dm755 bin/rdap "$pkgdir/usr/bin/${pkgname}"
	cd src/github.com/openrdap/"${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
