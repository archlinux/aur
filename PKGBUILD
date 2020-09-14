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
sha512sums=('c1a9df3949d834ffceb5ca91c9e4c773c59bd6b8e7e35e63afea0f856629aaca3423f5801cf9ed4c0fd1fc12ca36eddf73c4343a05ee5ff94af94e4b8501de06')

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
