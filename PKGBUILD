# Maintainer: Burak <burakberkkeskin@gmail.com>
pkgname=kubefwd-git
pkgver=1.22.3.r3.df9078d
pkgrel=1
pkgdesc="kubefwd is a command line utility built to port forward multiple services within one or more namespaces on one or more Kubernetes clusters."
arch=(x86_64)
url="https://github.com/txn2/kubefwd"
license=('GPL')
depends=('go')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("kubefwd")
source=("git+$url")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	go build ./cmd/kubefwd/kubefwd.go
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
