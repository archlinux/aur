# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=sxlock-git
_pkgname=sxlock
pkgver=1.1.r8.g1388c6e
pkgrel=1
pkgdesc="Simple screen locker utility for X, fork of sflock. Uses PAM authentication, no suid needed."
arch=('i686' 'x86_64')
url="https://github.com/lahwaacz/sxlock"
license=('MIT')
depends=('libxext' 'libxrandr' 'pam')
makedepends=('git')
source=('git://github.com/lahwaacz/sxlock.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
