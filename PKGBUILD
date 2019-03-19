# Maintainer: Marcos Ferreira <marcosp4f at gmail dot com>

_gitname="terraform-inventory"
pkgname="${_gitname}-git"
pkgver=0.8.2.gdd5c915
pkgrel=1
pkgdesc="Terraform State -> Ansible Dynamic Inventory"
arch=("x86_64")
url="https://github.com/adammck/terraform-inventory"
license=("MIT")
depends=()
makedepends=("go" "git")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/adammck/terraform-inventory")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  git describe --always --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

build() {
  cd "${_gitname}"
  export GOPATH="$srcdir/go" GOBIN="$srcdir/go/bin"
  go get
  go build
}


package() {
  cd "${_gitname}"
  install -Dm755 "$srcdir/go/bin/${_gitname}" "$pkgdir/usr/bin/${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
