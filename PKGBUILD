# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

_pkgname=terraform
pkgname=terraform-git
pkgver=v0.15.0.alpha20210210.r173.ge9c7f37b8c
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('x86_64')
provides=('terraform')
conflicts=('terraform')
license=('MPL2')
makedepends=('git' 'go-pie')
source=(${_pkgname}::"git+https://github.com/hashicorp/terraform.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd src/github.com/hashicorp/${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"
  mkdir -p src/github.com/hashicorp/
  mv "${_pkgname}" src/github.com/hashicorp/${_pkgname}
}

build() {
  cd src/github.com/hashicorp/"${_pkgname}"
  go build -o terraform-binary
}

package() {
  cd src/github.com/hashicorp/"${_pkgname}"
  install -Dm755 terraform-binary "$pkgdir/usr/bin/terraform"
}
