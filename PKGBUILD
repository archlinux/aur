# Submitter: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: David "Sid" Olofsson <contact@sidju.se>

pkgname=terraform-git
pkgver=v0.15.0.alpha20210210.r173.ge9c7f37b8c
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('x86_64')
provides=('terraform')
conflicts=('terraform')
license=('MPL2')
makedepends=('git')
source=("git+https://github.com/hashicorp/terraform.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd src/github.com/hashicorp/terraform
  git describe --long | sed 's/v\([^-]*\)-\([^-]*\).*/\1.\2/'
}

prepare() {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"
  mkdir -p src/github.com/hashicorp/
  mv "terraform" src/github.com/hashicorp/terraform
}

build() {
  cd src/github.com/hashicorp/terraform
  go build -o terraform-binary
}

package() {
  cd src/github.com/hashicorp/terraform
  install -Dm755 terraform-binary "$pkgdir/usr/bin/terraform"
}
