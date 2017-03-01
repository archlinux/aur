# Maintainer: Jonathan Wright <jon@than.io>

pkgname=go-bindata-git
pkgver=3.0.7.r72.ga0ff256
pkgrel=1
pkgdesc="Converts any file into managable Go source code - git checkout"
arch=(x86_64)
url="https://github.com/jteeuwen/go-bindata/"
license=(CC0-1.0)

source=("git+https://github.com/jteeuwen/go-bindata.git")
sha256sums=(SKIP)

makedepends=(git go)
provides=(go-bindata-git)
conflicts=(go-bindata)

pkgver() {
  cd "go-bindata"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	mkdir -p "gopath"
	export GOPATH=$PWD/gopath

	go get github.com/jteeuwen/go-bindata/...
}

package()
{
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib

	cp $srcdir/gopath/pkg/linux_amd64/github.com/jteeuwen/go-bindata.a $pkgdir/usr/lib
	cp $srcdir/gopath/bin/go-bindata $pkgdir/usr/bin
}
