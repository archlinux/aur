# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=cppqc-git
pkgver=r124.d68ec02
pkgrel=1
pkgdesc="QuickCheck-like property based automated testing tool for C++"
arch=('i686' 'x86_64')
url="https://github.com/philipp-classen/CppQuickCheck"

license=('BSD')

depends=(boost)
makedepends=('gcc' 'cmake')
source=('git+https://github.com/philipp-classen/CppQuickCheck.git')
md5sums=('SKIP')

pkgver() {
  cd CppQuickCheck
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/CppQuickCheck"
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr CMakeLists.txt
  make
}

package() {
  cd "${srcdir}/CppQuickCheck"
  make install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/cppqc/LICENSE"
}
