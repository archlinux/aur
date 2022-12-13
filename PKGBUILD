# Maintainer: Milad Alizadeh <milad@mil.ad>

_pkgname=massren
pkgname=$_pkgname-git
pkgver=r187.93e8c66
pkgrel=1
pkgdesc="Easily rename multiple files using your text editor"
url="https://github.com/laurent22/massren"
license=("MIT")
arch=('any')
makedepends=('git' 'go')
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/laurent22/$_pkgname")
sha256sums=('SKIP')


pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="${srcdir}"
  export GOBIN="${srcdir}/bin"
  export PATH=$PATH:$GOPATH/bin

  go install github.com/laurent22/massren@latest
}

package() {
  install -Dm755 "bin/massren" "$pkgdir/usr/bin/massren"
}

