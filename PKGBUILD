# Maintainer: Brian Gisseler <gissf1@gmail.com>
# Contributor: Ian Denhardt <ian@zenhack.net>
pkgname=arch-emerge-git
pkgver=r48.e463f1c
pkgrel=1
pkgdesc="A pacman frontend like Gentoo's emerge which manages packages based on a holistic view of the system"
arch=('any')
url="https://github.com/gissf1/arch-emerge"
license=('ISC')
source=('git+https://github.com/gissf1/arch-emerge')
makedepends=('git')
sha256sums=('SKIP')
backup=('etc/emerge/emerge.conf')

pkgver() {
  cd "$srcdir"/arch-emerge
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"/arch-emerge

  install -Dm755 emerge $pkgdir/usr/bin/emerge
  install -Dm644 emerge.8 $pkgdir/usr/share/man/man8/emerge.8
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm644 emerge.conf $pkgdir/usr/share/doc/$pkgname/emerge.conf
  install -dm755 $pkgdir/etc/emerge
  install -Dm644 emerge.conf $pkgdir/etc/emerge/emerge.conf
}
