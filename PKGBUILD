# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher
pkgver=6.5.1.0
pkgrel=1
pkgdesc="Pixel phone flashing GUI utility with features."
arch=('x86_64')
url="https://github.com/badabing2005/PixelFlasher"
license=('GPL3')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'python-bsdiff4'
  'python-json5'
  'python-lz4'
  'python-psutil'
  'python-pyperclip'
  'zlib'
)
makedepends=(
  'pyinstaller'
  'python-darkdetect'
  'python-httplib2'
  'python-markdown'
  'python-protobuf'
  'python-requests'
  'python-six'
  'python-wxpython'
)
optdepends=('android-tools: Use system platform tools'
            'scrcpy: Launch Screen Copy')
options=('!strip')
source=("PixelFlasher-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'PixelFlasher.desktop')
sha256sums=('f43ad27242eed76475e21dd457e12a8f433ba29f2e21135254d35df5c06387dd'
            '3f503e3e3b819562669e1d0a8a25043c478c8c1709b376642fd678caf3d8ee34')

build() {
  cd "PixelFlasher-$pkgver"
  pyinstaller --noconfirm build-on-linux.spec
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
