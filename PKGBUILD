# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: buckket <felix@buckket.org>

pkgname=redo-python
pkgver=0.42.d
pkgrel=1
pkgdesc="An implementation of the redo build system in Python"
arch=('any')
license=('GPL')
url="https://github.com/apenwarr/redo"
depends=('python')
makedepends=(
  'git'
  'python-beautifulsoup4'
  'python-markdown'
)
optdepends=('python-setproctitle: pretty output')
provides=('redo')
conflicts=('redo-sh' 'redo-c' 'redo-jdebp')
_commit='7f00abc36be15f398fa3ecf9f4e5283509c34a00' # redo-0.42d
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^redo-//' -e  's/\([[:alpha:]]\)$/.\1/'
}

check() {
  cd "$pkgname"

  local L_CFLAGS L_CXXFLAGS L_LDFLAGS
  L_CFLAGS=$CFLAGS
  L_CXXFLAGS=$CXXFLAGS
  L_LDFLAGS=$LDFLAGS

  unset CFLAGS CXXFLAGS LDFLAGS

  make test

  CFLAGS=$L_CFLAGS
  CXXFLAGS=$L_CXXFLAGS
  LDFLAGS=$L_LDFLAGS
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
