# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r980.b88c367
pkgrel=1
pkgdesc='A rofi inspired native client for web services. Supports youtube, peertube, soundcloud, nyaa.si, 4chan, matrix, saucenao, hotexamples, anilist and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
makedepends=('sibs')
depends=('sfml' 'libx11' 'jsoncpp' 'curl' 'mpv' 'libxrandr' 'noto-fonts')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin or opening remote links'
    'ffmpeg: For displaying webp thumbnails, uploading video thumbnails on matrix and merging video and audio when downloading youtube videos'
    'noto-fonts-cjk: To display chinese, japanese and korean characters'
)
provides=('quickmedia')
conflicts=('quickmedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.r980.b88c367.tar.gz")
sha512sums=('052354ae752941046ee55fd79cea8f581dcb780a8ce34d77eb512075cc78a8f65c5069edbb424c198d3476c4790d9a425c82fc0eb36415a87eadae6ed6c3ce5e')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/quickmedia" "$pkgdir/usr/bin/quickmedia"
  install -Dm644 boards.json "$pkgdir/usr/share/quickmedia/boards.json"
  install -Dm644 input.conf "$pkgdir/usr/share/quickmedia/input.conf"
  for file in images/* icons/* shaders/* themes/*; do
    install -Dm644 "$file" "$pkgdir/usr/share/quickmedia/$file"
  done
  for file in launcher/*; do
    filename=$(basename "$file")
    install -Dm644 "$file" "$pkgdir/usr/share/applications/$filename"
  done
}
