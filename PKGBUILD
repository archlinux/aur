# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=0.6.0
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=('gtksourceview5' 'libadwaita' 'portaudio' 'python-expandvars' 'python-gobject' 'python-gpt4all'
         'python-gtts' 'python-pyaudio' 'python-pygame' 'python-requests' 'python-speechrecognition')
makedepends=('git' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6a508035c114f04077e70f4d21d2b929e772b72682a0c94c81c8556d004c1787')

build() {
  arch-meson Newelle-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
  cd Newelle-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
