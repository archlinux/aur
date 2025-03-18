# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=newelle
pkgver=0.8.1
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=('gtksourceview5' 'libadwaita' 'portaudio' 'python-expandvars' 'python-gobject' 'python-gpt4all'
         'python-gtts' 'python-pyaudio' 'python-pygame' 'python-requests' 'python-speechrecognition'
         'python-matplotlib' 'python-numpy' 'python-pillow' 'python-pylatexenc')
makedepends=('git' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e13e2288c4b1ce778841a91293bcc4cd72b918d470fa66f388406528d2408cd0')

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
