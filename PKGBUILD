pkgname=i3-gaps-doubleborder
_pkgsourcename=i3
pkgver=20180710
pkgrel=1
pkgdesc='A fork of i3-gaps allowing double borders.'
arch=('i686' 'x86_64')
url='https://github.com/max-lv/i3'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm')
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
source=(git+https://github.com/max-lv/i3.git)
md5sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

prepare(){
  mkdir build
  cd "${_pkgsourcename}"

  autoreconf -fvi
  #mkdir build
}

build() {
  cd build

  ../i3/configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}/" install
  install -Dt "$pkgdir/usr/share/man/man1" -m644 man/*.1
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 ../i3/LICENSE
}
