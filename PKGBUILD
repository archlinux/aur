# Maintainer: Kevin Schoon <me@kevinschoon.com>
pkgname=go-capnproto2-git
provides=('go-capnproto2-git')
conflicts=('go-capnproto2')
pkgver=v3.0.0.alpha.24.r13.g1613bb0
pkgrel=1
pkgdesc="Cap'n Proto library and code generator for Go"
arch=('x86_64' 'aarch64')
url='https://github.com/capnproto/go-capnproto2'
license=('MIT')
depends=('go')
source=('git+https://github.com/capnproto/go-capnproto2.git')
sha256sums=('SKIP')

pkgver() {
  cd go-capnproto2
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd go-capnproto2/capnpc-go
	go build -o capnpc-go
}

package() {
	install -D -m755 \
		go-capnproto2/capnpc-go/capnpc-go ${pkgdir}/usr/bin/capnpc-go
	install -D -m644 \
		go-capnproto2/std/go.capnp ${pkgdir}/usr/include/go-capnproto2/go.capnp
	install -D -m644 \
		go-capnproto2/LICENSE ${pkgdir}/usr/share/licenses/go-capnproto2/LICENSE
}
