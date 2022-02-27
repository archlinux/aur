# Maintainer: fzerorubigd <fzero@rubi.gd>
pkgname=protobuf-go
pkgver=1.5.2
pkgrel=2
pkgdesc="Go support for Google's protocol buffers"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/golang/protobuf"
license=('BSD')
depends=('protobuf')
makedepends=('go' 'git')
source=("https://github.com/golang/protobuf/archive/v${pkgver}.tar.gz")

_gitname=protobuf

build() {
	mkdir -p ${srcdir}/src/github.com/golang/
	cp -r ${srcdir}/protobuf-${pkgver} ${srcdir}/src/github.com/golang/protobuf
	cd ${srcdir}/src/github.com/golang/protobuf
	GOPATH=${srcdir} GOBIN=${srcdir}/bin GOFLAGS="-modcacherw" go get -v ./...
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/protoc-gen-go $pkgdir/usr/bin/protoc-gen-go
}

sha256sums=('088cc0f3ba18fb8f9d00319568ff0af5a06d8925a6e6cb983bb837b4efb703b3')
