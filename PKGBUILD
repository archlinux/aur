# Maintainer: Rhys Perry <rhysperry111@gmail.com>
# Based off of the i3-gaps pkgbuild

pkgname=i3-gaps-rounded
_pkgsourcename=i3
pkgver=4.16.1
pkgrel=1
pkgdesc='A fork of i3wm tiling window manager with more features, including gaps and rounded corners'
arch=('i686' 'x86_64')
url='https://github.com/resloved/i3'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm')
groups=('i3')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11')
makedepends=('bison' 'flex' 'asciidoc' 'xmlto')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
backup=(etc/i3/config)
options=('docs' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/resloved/i3/archive/${pkgver}.tar.gz")

prepare(){
  mkdir build
  cd "${_pkgsourcename}-${pkgver}"

  autoreconf -fvi
}

build() {
  cd build

  ../i3-$pkgver/configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}/" install
  install -Dt "$pkgdir/usr/share/man/man1" -m644 man/*.1
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ../i3-$pkgver/LICENSE
}

# vim:set ts=2 sw=2 et:
md5sums=('d9093a4d9c3e0856844696ffdb199b8b')
