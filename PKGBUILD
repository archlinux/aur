# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher
pkgver=6.0.1.0
pkgrel=1
pkgdesc="Pixel phone flashing GUI utility with features."
arch=('x86_64')
url="https://github.com/badabing2005/PixelFlasher"
license=('GPL3')
depends=('glibc' 'hicolor-icon-theme' 'python-bsdiff4' 'python-lz4' 'python-psutil'
         'python-pyperclip' 'zlib')
makedepends=('pyinstaller' 'python-darkdetect' 'python-httplib2' 'python-markdown'
             'python-protobuf' 'python-requests' 'python-six' 'python-wxpython')
optdepends=('android-tools' 'scrcpy')
options=('!strip')
source=("PixelFlasher-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'PixelFlasher.desktop')
sha256sums=('7b874f9f6d9b2ac72c2afd02e0414668d3ff5c9012cf450b85b2f21bb9179f49'
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
