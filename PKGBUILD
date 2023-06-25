pkgname=gumtree-git
pkgver=r985.c416c1f
pkgrel=1
pkgdec='A syntax-aware diff tool'
arch=('any')
url='https://github.com/GumTreeDiff/gumtree'
license=('LGPL3')
depends=(
  'jdk17-openjdk'
)
optdepends=(
  'gumtree-tree-sitter-git: tree-sitter parsers'
)
source=(
  "gumtree::git+https://github.com/GumTreeDiff/gumtree"
  'gumtree.sh'
)
sha256sums=(
  SKIP
  '9a6e5c18cff2be9f1d03294017ee8392a6811f91e33ae382a08f3c23f92b8518'
)

pkgver() {
  cd "$srcdir/gumtree"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/gumtree"
  JAVA_HOME="/usr/lib/jvm/java-17-openjdk" "./gradlew" build
}

package() {
  cd "$srcdir/gumtree"
  install -d "$pkgdir/usr/lib/gumtree" "$pkgdir/usr/bin"
  install "../gumtree.sh" "$pkgdir/usr/lib/gumtree/gumtree.sh"
  cp -r "./dist/build/install/gumtree" "$pkgdir/usr/lib"
  ln -s "/usr/lib/gumtree/gumtree.sh" "$pkgdir/usr/bin/gumtree"
}
