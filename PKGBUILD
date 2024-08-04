# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=cups-sharing
pkgname=$_pkgname-git
pkgver=r7.87d744e
pkgrel=1
pkgdesc="CUPS Sharing Server"
arch=('x86_64')
url="https://github.com/OpenPrinting/$_pkgname"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libcups-git' 'pappl-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  ./configure --prefix=/usr
}

build() {
  cd $_pkgname
  make
}

#check() {
#  cd $_pkgname
#  make test
#}

package() {
  cd $_pkgname
  make BUILDROOT="${pkgdir}" install
  install -Dm644 "${srcdir}"/$_pkgname/NOTICE "${pkgdir}"/usr/share/licenses/$pkgname/LLVM-exception
}
