pkgname=rubycreator-git
pkgver=VERSION
pkgrel=1
pkgdesc="Plugin to add Ruby language support to QtCreator IDE."
arch=("x86_64")
url="http://hugopl.github.io/RubyCreator/"
license=('LGPL3')
groups=()
depends=('qtcreator')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/hugopl/RubyCreator.git#branch=qtc-3.5')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/RubyCreator"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/RubyCreator"
  ./configure.rb
  cd build
  make -j9
}

check() {
  test -f "$srcdir/RubyCreator/build/libRuby.so"
}

package() {
  mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
  mv "$srcdir/RubyCreator/build/libRuby.so" "$pkgdir/usr/lib/qtcreator/plugins"
}
