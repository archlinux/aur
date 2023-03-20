# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-git
_gitname=kuzu
pkgver=v0.0.2.r114.gff3c5038
pkgrel=1
epoch=
pkgdesc="In-process property graph database management system (GDBMS) built for query speed and scalability"
arch=('i686' 'x86_64')
url="kuzudb.com"
license=('MIT')
groups=()
depends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${_gitname}::git+https://github.com/kuzudb/${_gitname}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  make release NUM_THREADS=`nproc` GEN=ninja
}

package() {
  mkdir -p "$pkgdir/usr/include/kuzu" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname}/src/include/main/* "$pkgdir/usr/include/kuzu"
  cp ${srcdir}/${_gitname}/build/release/src/libkuzu.* "$pkgdir/usr/lib"
  cp ${srcdir}/${_gitname}/build/release/tools/shell/kuzu_shell "$pkgdir/usr/bin/kuzu"
  install -Dm644 ${srcdir}/${_gitname}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
