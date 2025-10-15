# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=keyboard-center2
_pkgname=keyboard-center
pkgver=2.0.7
pkgrel=1
pkgdesc="Application to map G-keys on (some) Logitech Gaming Keyboards"
arch=('x86_64')
url="https://github.com/zocker-160/keyboard-center"
license=('GPL3')
depends=(
  'python>=3.12'
  'python-pyqt5>=5.15'
  'python-uinput>=1.0.1'
  'python-pyusb>=1.0.2'
  'python-lupa>=1.14'
  'python-setuptools'
  'hidapi>=0.10'
  'libnotify>=0.7.9'
  'lua>=5.3'
)
optdepends=(
  'openrgb: RGB control for your keyboard'
  'xdotool: type strings for X11'
  'ydotool: type strings using uinput'
  'wtype: type strings for Wayland'
)
conflicts=('keyboard-center' 'keyboard-center-git')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/zocker-160/keyboard-center.git#tag=$pkgver")
sha256sums=('SKIP')

install=keyboard-center.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # nothing to see here
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # still nothing to see here
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/opt"
  cp -r keyboard_center/. "$pkgdir/opt/$_pkgname"

  install -D -m644 linux_packaging/60-keyboard-center.rules -t "$pkgdir/usr/lib/udev/rules.d"
  install -D -m644 linux_packaging/uinput-keyboard-center.conf "$pkgdir/usr/lib/modules-load.d/$_pkgname.conf"

  install -D -m755 linux_packaging/assets/keyboard-center.sh "$pkgdir/usr/bin/$_pkgname"
  install -D -m644 linux_packaging/assets/keyboard-center.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -D -m644 linux_packaging/assets/keyboard-center.desktop -t "$pkgdir/usr/share/applications"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
