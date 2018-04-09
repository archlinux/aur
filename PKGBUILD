# Maintainer: Noel Kuntze <noel@familie-kuntze.de>
pkgname=bsearch
pkgver=1.0.2
pkgrel=1
pkgdesc="Utility for binary searching a sorted file for lines that start with the search key"
arch=('x86_64')
url="https://github.com/jamesridgway/bsearch"
license=('GPL')
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamesridgway/bsearch/archive/${pkgver}.tar.gz")
sha256sums=('4520918349e6f82d8f0c1586d2fdf3dfe9b1300a6f7d68faa5180454739d53f7')

prepare() {
	cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}/fakegopath"

    mkdir -p "${GOPATH}/src/github.com/jamesridgway/bsearch/"
    cp -R "${srcdir}/${pkgname}-${pkgver}/"* "${GOPATH}/src/github.com/jamesridgway/bsearch/"
    
}

build() {
	cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}/fakegopath"

    go get -v github.com/jamesridgway/bsearch
    cd "${GOPATH}"/src/github.com/jamesridgway/bsearch
    go build -pkgdir "${pkgdir}"
}

check() {
	cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}/fakegopath"
    cd "${GOPATH}"/src/github.com/jamesridgway/bsearch
    go test
}

package() {
	cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}/fakegopath"
    go build -o out/bsearch

	mkdir -p "${pkgdir}/usr/share/man/man1/" "${pkgdir}/usr/bin/"
	cp "bsearch.1" "${pkgdir}/usr/share/man/man1/bsearch.1"
	cp "out/bsearch" "${pkgdir}/usr/bin/"
}
