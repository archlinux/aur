# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher
pkgver=5.8.0.2
pkgrel=1
pkgdesc="Pixel phone flashing GUI utility with features."
arch=('x86_64')
url="https://github.com/badabing2005/PixelFlasher"
license=('GPL3')
depends=('glibc' 'hicolor-icon-theme' 'python-bsdiff4' 'python-clipboard'
         'python-lz4' 'zlib')
makedepends=('pyinstaller' 'python-darkdetect' 'python-httplib2' 'python-markdown'
             'python-protobuf' 'python-requests' 'python-six' 'python-wxpython')
optdepends=('android-tools' 'scrcpy')
options=('!strip')
source=("PixelFlasher-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'PixelFlasher.desktop')
sha256sums=('ebf0d455a33fa2b6af270f901061c8bbe9580f5f666d30d4041827e675339337'
            '3f503e3e3b819562669e1d0a8a25043c478c8c1709b376642fd678caf3d8ee34')

build() {
  cd "PixelFlasher-$pkgver"
  pyinstaller --log-level=DEBUG \
    --noconfirm \
    build-on-linux.spec
}

package() {
  cd "PixelFlasher-$pkgver"
  install -Dm755 dist/PixelFlasher -t "$pkgdir/usr/bin/"

  for i in 64 128 256; do
    install -Dm644 "images/icon-${i}.png" \
    "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/PixelFlasher.png"
  done

  install -Dm644 "$srcdir/PixelFlasher.desktop" -t "$pkgdir/usr/share/applications/"
}
