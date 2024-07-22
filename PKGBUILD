# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=libppd
pkgname=$_pkgname-git
pkgver=2.0.0.r11.g327b61cf
pkgrel=1
pkgdesc="Legacy support library for PPD files"
arch=(x86_64)
url="https://github.com/OpenPrinting/$_pkgname"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libcups-git' 'libcupsfilters-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always --tags | sed 's|-|.r|;s|-|.|'
}

prepare() {
  cd ${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd ${_pkgname}
  make
}

check() {
  cd ${_pkgname}
  make check
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir/" install
  install -Dm644 "${srcdir}"/$_pkgname/NOTICE "${pkgdir}"/usr/share/licenses/$pkgname/LLVM-exception
}
