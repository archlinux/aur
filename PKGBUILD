# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=Rumpeltreepp
pkgname=rumpeltreepp-git
pkgver=r47.2831391
pkgrel=1
pkgdesc="C++ Rumpelstiltskin tree-graph library"
arch=(i686 x86_64)
url="http://pibara.github.io/Rumpeltreepp/"
license=('GPL2')
depends=('crypto++')
makedepends=('cmake')
source=("${_pkgname}::git+git://github.com/pibara/${_pkgname}.git"
        "fix.patch")
sha256sums=('SKIP'
            '3db1f5e8244d957bc6684c6c89bf299e3b9ec09443681c590fe84b3c3e5eee05')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch < ${srcdir}/fix.patch
  cmake .
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
