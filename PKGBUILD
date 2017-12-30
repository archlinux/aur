# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: realitygaps <realitygaps[at]yahoo[dot]com>

appname=qtpass
pkgname=qtpass-git
pkgver=1.2.0.r6.f3e89ac2
pkgrel=3
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

prepare() {
    cd "$srcdir/$appname"
    sed -i 's|qtpass-icon|qtpass|' $appname.desktop
}

build() {
  cd "$srcdir/$appname"
  qmake .
  make
}

package() {
  install -Dm0755 "$srcdir/$appname/main/qtpass" "$pkgdir/usr/bin/$appname"
  install -Dm0644 "$srcdir/$appname/artwork/icon.png" "$pkgdir/usr/share/pixmaps/$appname.png"
  install -Dm0644 "$srcdir/$appname/qtpass.desktop" "$pkgdir/usr/share/applications/$appname.desktop"
  install -Dm0644 "$srcdir/$appname/$appname.1" "$pkgdir/usr/share/man/man1/$appname.1"
} 
# vim:set ts=2 sw=2 et:

