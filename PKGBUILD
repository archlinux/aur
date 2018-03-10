# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds
#
# Due to https://twitter.com/francesc/status/961249107020001280
# This package follows https://github.com/kevinburke/go-bindata the same that Google's Bazel build system now does
# https://github.com/bazelbuild/rules_go/pull/1308
pkgname=go-bindata-new-git
pkgver=3.7.0.r3.g2197b05
pkgrel=1
pkgdesc="A small utility which generates Go code from any file. Useful for embedding binary data in a Go program."
arch=(x86_64)
url="https://github.com/kevinburke/go-bindata/"
license=(CC0-1.0)

source=("git+https://github.com/kevinburke/go-bindata.git")
sha256sums=('SKIP')

makedepends=(git go)
provides=(go-bindata)
conflicts=(go-bindata go-bindata-git)
options=('!strip')

pkgver() {
  cd "go-bindata"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	mkdir -p "gopath"
	export GOPATH=$PWD/gopath

	go get github.com/kevinburke/go-bindata/...
}

package()
{
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib

	cp $srcdir/gopath/pkg/linux_amd64/github.com/kevinburke/go-bindata.a $pkgdir/usr/lib
	cp $srcdir/gopath/bin/go-bindata $pkgdir/usr/bin
}
