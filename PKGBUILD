# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-git
_pkgname=matterhorn

pkgver=50200.0.0
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | cut -d- -f1
}

pkgrel=1
pkgdesc='A terminal-based chat client for MatterMost'
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
makedepends=('git' 'cabal-install' 'ghc8.0')
source=("$_pkgname::git+https://github.com/matterhorn-chat/matterhorn.git")
sha1sums=('SKIP')
provides=('matterhorn')
conflicts=('matterhorn' 'matterhorn-bin')

build() {
  cd "$srcdir/$_pkgname"
  git submodule update --init
  cabal new-update
  cabal new-build -w /usr/bin/ghc-8.0
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname
  cp $(find . -name $_pkgname -type f) $pkgdir/usr/bin
  cp LICENSE $pkgdir/usr/share/licenses/$_pkgname
}
