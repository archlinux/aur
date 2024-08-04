# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=libcups
pkgname=$_pkgname-git
pkgver=3.0b2.r146.ga3eedb6ac
pkgrel=1
pkgdesc="The CUPS library"
arch=('x86_64')
url="https://github.com/OpenPrinting/$_pkgname"
license=('Apache-2.0 WITH LLVM-exception')
depends=('avahi' 'pdfio-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'cups' 'cups-git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always --tags | sed 's|^v||;s|-|.r|;s|-|.|'
}

prepare() {
  cd $_pkgname
  ./configure --prefix=/usr
}

build() {
  cd $_pkgname
  make
}

# testdnssd is currently crashing / dumping core
#check() {
#  cd $_pkgname
#  make test
#}

package() {
  cd $_pkgname
  make BUILDROOT="${pkgdir}" install
  install -Dm644 "${srcdir}"/$_pkgname/NOTICE "${pkgdir}"/usr/share/licenses/$pkgname/LLVM-exception
}
