_pkgname=cpp-dependencies
pkgname="$_pkgname-git"
pkgver=r35.9b83893
pkgrel=1
pkgdesc="Tool to check C++ #include dependencies (dependency graphs created in .dot format)"
arch=(i686 x86_64)
url="https://github.com/tomtom-international/cpp-dependencies"
license=(Apache)
depends=(boost)
makedepends=(git gcc)
optdepends=('graphviz: Render output graphs')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/tomtom-international/cpp-dependencies.git')
md5sums=(SKIP)

pkgver(){
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/$_pkgname"
  rm -rf cpp-dependencies/
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 cpp-dependencies "$pkgdir"/usr/bin/cpp-dependencies
}

# vim:set ts=2 sw=2 et:
