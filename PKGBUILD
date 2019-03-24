# Maintainer: Per Osbäck <per@osbeck.com>
_gitname="terraform-provider-loopia"
pkgname="${_gitname}-git"
pkgver=r9.5493abf
pkgrel=1
arch=("x86_64")
url="https://github.com/jonlil/terraform-provider-loopia"
license=("MIT")
depends=()
makedepends=("go" "git")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/jonlil/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_gitname}"
  export GOPATH="$srcdir/go" GOBIN="$srcdir/go/bin"
  go get -v
  go build
}
package() {
  cd "${_gitname}"
  install -Dm755 "$srcdir/go/bin/${_gitname}" "$pkgdir/usr/bin/${_gitname}"
}
