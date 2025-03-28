# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-git
pkgver=3.38.0.r0.gb1a1d61
pkgrel=1
pkgdesc="A CLI utility to list installed packages with filtering and sorting, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go" "git")
provides=("yaylog")
conflicts=("yaylog" "yaylog-bin")
source=("git+https://github.com/Zweih/yaylog.git")
sha256sums=('SKIP')

_binaryname="yaylog"

pkgver() {
  cd "$srcdir/yaylog"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/yaylog"
  export CGO_ENABLED=0
  go build -trimpath -o ${_binaryname} ./cmd/${_binaryname}
}

package() {
  cd "$srcdir/yaylog"
  install -Dm755 "${_binaryname}" "$pkgdir/usr/bin/${_binaryname}"
  install -Dm644 "${_binaryname}.1" "$pkgdir/usr/share/man/man1/${_binaryname}.1"
}
