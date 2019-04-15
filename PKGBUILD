# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=helmsman-git
pkgver=1.8.1.r8.gbe24069
pkgrel=1
pkgdesc="Helmsman upstream"
arch=('x86_64')
url="https://github.com/Praqma/helmsman"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('helmsman::git://github.com/Praqma/helmsman')
md5sums=('SKIP')
_gourl=github.com/Praqma/helmsman

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
	cd "$srcdir/${pkgname%-git}"
	GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/helmsman" "$pkgdir/usr/bin"
}
