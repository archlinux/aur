# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=cups-filters
pkgname=$_pkgname-git
pkgver=2.0.1.r58.g82acfaf1e
pkgrel=1
pkgdesc="Package retro-fitting the filter functions of libcupsfilters and libppd to CUPS 2.x"
arch=('x86_64' 'aarch64')
url="https://github.com/OpenPrinting/$_pkgname"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libcups' 'libppd')
makedepends=('git' 'ghostscript' 'mupdf-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
#options=('!emptydirs')
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
