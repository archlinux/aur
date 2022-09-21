# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='upscayl-appimage'
pkgdesc='Free and Open Source AI Image Upscaler'
pkgver='1.5.0'
pkgrel='1'
arch=('any')
url='https://github.com/upscayl/upscayl'
_repo='https://github.com/upscayl/upscayl'
license=('AGPL3')
depends=('bash')
makedepends=('fuse2' 'zlib')
source=(
  "https://github.com/upscayl/upscayl/releases/download/v$pkgver/Upscayl-$pkgver.AppImage"
  "https://github.com/upscayl/upscayl/raw/v$pkgver/Real-ESRGAN_LICENSE.txt"
  'upscayl.desktop'
  'upscayl'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
conflicts=(
  'upscayl'
  'upscayl-bin'
)
provides=(
  'upscayl'
)

build() {
  chmod +x "./Upscayl-$pkgver.AppImage"
  "./Upscayl-$pkgver.AppImage" --appimage-extract
}

package() {
  msg2 'Creating target directory...'
  mkdir -p "$pkgdir/opt/"

  msg2 'Installing files from squashfs-root to target directory...'
  cp -r squashfs-root "$pkgdir/opt/upscayl"

  msg2 'Installing the upscayl command...'
  install -Dm755 upscayl "$pkgdir/usr/bin/upscayl"

  msg2 'Installing the desktop file...'
  install -Dm755 upscayl.desktop "$pkgdir/usr/share/applications/upscayl.desktop"

  msg2 'Installing the icon...'
  mkdir -p "$pkgdir/usr/share/pixmaps"
  ln -s /opt/upscayl/upscayl.png "$pkgdir/usr/share/pixmaps/upscayl.png"

  msg2 'Installing the licenses...'
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s /opt/upscayl/LICENSE.electron.txt "$pkgdir/usr/share/licenses/LICENSE.electron.txt"
  ln -s /opt/upscayl/LICENSES.chromium.html "$pkgdir/usr/share/licenses/LICENSES.chromium.html"
  install -Dm644 Real-ESRGAN_LICENSE.txt "$pkgdir/usr/share/licenses/Real-ESRGAN_LICENSE.txt"
}
