# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>
# Contributor: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>

pkgname=lapdog
pkgver=1.0
pkgrel=1
pkgdesc='Take actions when specific devices appear/disappear from your LAN'
arch=('i686' 'x86_64')
url='https://github.com/ltworf/lapdog'
license=('GPL')
depends=('liboping')
makedepends=('cmake')
source=('git+https://github.com/ltworf/lapdog.git')
sha1sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch < ../../cmake_path.diff
}

build() {
  cd "${srcdir}"
  mkdir -p _build && cd _build

  cmake -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}"
  make
}

package() {
  cd "${srcdir}/_build"
  make DESTDIR="${pkgdir}" install
}
