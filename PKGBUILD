# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=0.2.1
_commit=293d38a0edf264a252b820327b4af2b8b638b093
pkgrel=3
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=('gtksourceview5' 'libadwaita' 'portaudio' 'python-cffi' 'python-expandvars'
         'python-gobject' 'python-gpt4all' 'python-gtts' 'python-pip' 'python-playsound'
         'python-pyaudio' 'python-requests' 'python-speechrecognition') #'python-curl-cffi' #'python-g4f'
makedepends=('git' 'meson')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson Newelle build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/$pkgname"
  install -Dm644 Newelle/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 Newelle/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
