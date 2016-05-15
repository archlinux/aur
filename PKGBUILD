# Maintainer: Luke Kuza <luke.kuza@gmail.com>

pkgname=('goofys')
pkgver=0.0.5.15.gbf6e5f8
pkgrel=1
pkgdesc="Goofys is a high performance Amazon S3 backend filey-system 
interface"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/kahing/goofys/"
license=('Apache')
makedepends=("git" "go" "fuse")

prepare () {
	GOPATH="$srcdir" go get github.com/kahing/goofys
}

pkgver () {
	cd $srcdir/src/github.com/kahing/goofys
	pkgv1="$(echo "$(git describe --tags)" | sed -e 's/\-/./g')"
	echo "$(echo $pkgv1 | cut -c 2-)"
}

build() {
	GOPATH="$srcdir" go install github.com/kahing/goofys
}

package() {
	mkdir -p $pkgdir/usr/bin/
	cp $srcdir/bin/goofys $pkgdir/usr/bin
}
