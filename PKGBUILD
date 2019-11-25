# Maintainer: Corentin Peuvrel <corentin.peuvrel@gmail.com>

_pkgname=terraform
pkgname=terraform11
pkgver=0.11.14
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("git" "go-pie")
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/v$pkgver.tar.gz")
sha256sums=("50b75c94c4d3bfe44cfc12c740126747b6b34c014602777154356caa85a783f4")

prepare() {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"
  mkdir -p src/github.com/hashicorp/
  mv "${_pkgname}-${pkgver}" src/github.com/hashicorp/${_pkgname}
}

build() {
  cd src/github.com/hashicorp/"${_pkgname}"
  go build -o terraform-binary
}

package() {
  cd src/github.com/hashicorp/"${_pkgname}"
  install -Dm755 terraform-binary "$pkgdir/usr/bin/terraform11"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
