# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-git
pkgver=3.41.0.r0.gfe7ee78
pkgrel=2
pkgdesc="(DEPRECATED) This package has been renamed to 'qp'. Please install 'qp' instead."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go" "git")
provides=("yaylog")
conflicts=("yaylog" "yaylog-bin")
source=("git+https://github.com/Zweih/yaylog.git")
sha256sums=('SKIP')
install='yaylog.install'

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
