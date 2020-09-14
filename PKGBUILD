# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r217.39609fe
pkgrel=1
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
source=("quickmedia.tar.gz::https://dec05eba.com/snapshot/QuickMedia.tar.gz")
sha512sums=('820440d018e39636931cb231240cd83731e36fc82dab7e69814b83540e54295cbaa0b6e6a7b87539ca2e64a92897b41732c69c0e51cbe623533c3ab6ddbb808d')

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
