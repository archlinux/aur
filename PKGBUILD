# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r220.b95298d
pkgrel=2
pkgdesc='A native client for web media. Works with youtube, 4chan and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
makedepends=('sibs')
depends=('sfml' 'libx11' 'jsoncpp' 'cppcodec' 'tidy' 'curl' 'mpv' 'youtube-dl' 'libglvnd' 'libxrandr')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
)
provides=('QuickMedia')
conflicts=('QuickMedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.tar.gz")
sha512sums=('a5ebf9688f54f306f4cf39fe46f5e8721b719a0470f0a31370c2e38ffd556f79039c2d22eb712c24b10bdfcd1867f334cad9956873e82088f6f9154ba83d51f9')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/QuickMedia" "$pkgdir/usr/bin/QuickMedia"
  install -Dm644 boards.json "$pkgdir/usr/share/quickmedia/boards.json"
  for file in fonts/* images/* icons/*; do
    install -Dm644 "$file" "$pkgdir/usr/share/quickmedia/$file"
  done
  for file in launcher/*; do
    filename=$(basename "$file")
    install -Dm644 "$file" "$pkgdir/usr/share/applications/$filename"
  done
}
