# Maintainer: Ian Denhardt <ian@zenhack.net>
pkgname=pacsync-git
pkgver=9
pkgrel=1
pkgdesc="A pacman frontend which manages packages based on a holistic view of the system"
arch=('any')
url="https://gitlab.com/isd/pacsync"
license=('custom')
source=('git+https://gitlab.com/isd/pacsync')
replaces=('pacsync-hg')
makedepends=('git')

pkgver() {
  # We omit the leading r recommended in the VCS package guidelines, because:
  #
  # - Earlier versions of this package already used bare numbers, so adding
  #   an r would cause the version number to run backwards
  # - We can guarantee upstream will never tag a release (since the author
  #   of this PKGBUILD is also the upstream author), so there is no need to
  #   worry about a release appearing and messing up the versioning
  cd "$srcdir"/pacsync
  git rev-list --count HEAD
}

package() {
  cd "$srcdir"/pacsync

  install -Dm755 pacsync $pkgdir/usr/bin/pacsync
  install -Dm644 pacsync.8 $pkgdir/usr/share/man/man8/pacsync.8
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -dm755 $pkgdir/etc/pacsync
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP')
