# Maintainer: Corentin Peuvrel <corentin.peuvrel@gmail.com>

_pkgname=terraform
pkgname=terraform11
pkgver=v0.11.14.r0.g12bf5f6afe
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('x86_64')
provides=('terraform11')
license=('MPL')
makedepends=('git' 'go-pie')
source=(${_pkgname}::"git+https://github.com/hashicorp/terraform.git#tag=v0.11.14")
sha256sums=('SKIP')

pkgver() {
  cd src/github.com/hashicorp/${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"
  mkdir -p src/github.com/hashicorp/
  ln -sf ../../../${_pkgname} src/github.com/hashicorp/
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
