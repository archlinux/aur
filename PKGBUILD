# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=0.7.0
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=('gtksourceview5' 'libadwaita' 'portaudio' 'python-expandvars' 'python-gobject' 'python-gpt4all'
         'python-gtts' 'python-pyaudio' 'python-pygame' 'python-requests' 'python-speechrecognition')
makedepends=('git' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2de4c42e7cf24b8c2b708389ceed4f7982bf510ffb9836f3db7a28b817394a01')

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
