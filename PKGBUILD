# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: realitygaps <realitygaps[at]yahoo[dot]com>

appname=qtpass
pkgname=qtpass-git
pkgver=1.2.0.r6.f3e89ac2
pkgrel=1
pkgdesc='QtPass is a multi-platform GUI for pass, the standard unix password manager'
url='https://qtpass.org'
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gnupg')
makedepends=('qt5-base')
optdepends=('xdg-utils' 'git' 'pass')
provides=('qtpass')
conflicts=('qtpass')
install=qtpass.install
source=('git://github.com/ijhack/qtpass')
md5sums=('SKIP')

pkgver() {
  cd $appname
  echo "$(git describe | sed 's/^v//; s/-/.r/; s/-g/./')"
}

build() {
  cd "$srcdir/$appname"
  qmake .
  make
}

package() {
  install -Dm755 "$srcdir/$appname/main/qtpass" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$appname/artwork/icon.png" -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/qtpass.png"
  install -Dm644 "$srcdir/$appname/qtpass.desktop" -t "$pkgdir/usr/share/applications/qtpass.desktop"
} 
# vim:set ts=2 sw=2 et:

