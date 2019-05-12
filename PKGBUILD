# Maintainer: Carl Schwan <carl at carlschwan dot eu>

pkgname=i3-plasma
_pkgsourcename=i3-plasma
pkgver=4.16.1
pkgrel=1
pkgdesc='A fork of i3-gaps tiling window manager with default configuration for plasma'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/i3'
license=('GPL-3.0')
provides=('i3-wm' 'kwin')
conflicts=('i3-wm' 'i3-gaps')
groups=('i3')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11' 'plasma-desktop' 'wmctrl')
makedepends=('bison' 'flex' 'asciidoc' 'xmlto')
optdepends=('konsole:  The terminal emulator used in the default config.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
backup=(etc/i3/config)
options=('docs' '!strip')
source=("$pkgname-$pkgver::git+https://gitlab.com/ognarb/i3-kde.git")
sha256sums=('SKIP')

prepare(){
  mkdir -p build
  echo "$pkgname"
  cd "$pkgname-$pkgver"

  autoreconf -fvi
}

build() {
  cd build

  ../$pkgname-$pkgver/configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}/" install
  install -Dt "$pkgdir/usr/share/man/man1" -m644 man/*.1
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ../$pkgname-$pkgver/LICENSE
}

# vim:set ts=2 sw=2 et:

