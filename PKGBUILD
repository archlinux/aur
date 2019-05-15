# Contributor: tyr0 <thomas.hoernes@gmx.at>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Y Paritcher <y.archlinux@paritcher.com>

pkgname=xxdiff
pkgver=5.0
pkgrel=1
pkgdesc="A graphical browser for file and directory differences."
url="https://bitbucket.org/blais/xxdiff"
license=('GPL2')
depends=('qt5-base')
makedepends=('flex>=2.5.31' 'bison' 'mercurial' 'python-docutils')
arch=('x86_64' 'i686')
source=("hg+https://bitbucket.org/blais/xxdiff#revision=5e5f885" "cpp11.diff")
md5sums=('SKIP'
         'feb486afc64fa53cfc348219d3779d41')

prepare() {
  cd "xxdiff/src"
  # Debian C++11 Patch
  patch -N -i ../../cpp11.diff
}

build() {
  cd "$pkgname/src"
  make -f Makefile.bootstrap
  make
}

package() {
  cd "$pkgname"
  install -D -m 755 "bin/xxdiff" "$pkgdir/usr/bin/xxdiff"
  install -D -m 644 "src/xxdiff.1" "$pkgdir/usr/share/man/man1/xxdiff.1"
}
