# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jan Fader <jan.fader@web.de>
pkgname=keynav
pkgver=0.20110708.0
pkgrel=2
pkgdesc="Ingenious and fast way to move the mouse pointer on the screen with keystrokes."
url="http://www.semicomplete.com/projects/keynav/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('xdotool')
#source=("http://semicomplete.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
source=("http://http.debian.net/debian/pool/main/k/keynav/keynav_$pkgver.orig.tar.gz")
md5sums=('d1b273d72b15fc9c28270c28f644e7c6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/xdo_symbol_map/xdo_get_symbol_map/' \
      -e 's/xdo_window_setclass/xdo_set_window_class/' \
      -e 's/xdo_window_get_active/xdo_get_window_at_mouse/' \
      -e 's/xdo_click/xdo_click_window/' \
      -e 's/xdo_mouseup/xdo_mouse_up/' \
      -e 's/xdo_mousedown/xdo_mouse_down/' \
      -e 's/xdo_mousemove/xdo_move_mouse/' \
      -e 's/xdo_mousemove_relative/xdo_move_mouse_relative/' \
      -e 's/xdo_mouselocation/xdo_get_mouse_location/' \
      -e 's/xdo_mouse_wait_for_move_to/xdo_wait_for_mouse_move_to/' \
      -e 's/xdo_keysequence_up/xdo_send_keysequence_window_up/' \
      -e 's/xdo_keysequence_down/xdo_send_keysequence_window_down/' \
      -i keynav.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make keynav
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D keynav   "$pkgdir/usr/bin/keynav"
  install -D keynavrc "$pkgdir/etc/keynavrc"
}

# vim:set ts=2 sw=2 et:
