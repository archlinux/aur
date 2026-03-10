# Maintainer: gimletlove

pkgname=imagecompare-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Image Comparison Program with various helpful features and tools.'
arch=('x86_64')
url='https://github.com/gimletlove/image-compare'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'libvips' 'hicolor-icon-theme')
optdepends=(
  'libjxl: JPEG XL image support'
  'libheif: HEIF and HEIC image support'
)
provides=('imagecompare')
conflicts=('imagecompare')
source=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/$pkgver/imagecompare-linux-$pkgver.zip")
noextract=("$pkgname-$pkgver-x86_64.zip")
sha256sums=('9f5a1c5c1d8c464f1fdbc2d16d17de7dae8fbb7e7d4b6f858fe3422b5691c864')

package() {
  local _archive="$srcdir/$pkgname-$pkgver-x86_64.zip"
  local _extractdir="$srcdir/extract"

  rm -rf "$_extractdir"
  install -d "$_extractdir"

  bsdtar -xf "$_archive" -C "$_extractdir"

  install -Dm755 "$_extractdir/bin/imagecompare" \
    "$pkgdir/usr/bin/imagecompare"

  install -Dm644 "$_extractdir/share/applications/io.github.gimletlove.imagecompare.desktop" \
    "$pkgdir/usr/share/applications/io.github.gimletlove.imagecompare.desktop"

  install -Dm644 "$_extractdir/share/icons/hicolor/scalable/apps/io.github.gimletlove.imagecompare.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.gimletlove.imagecompare.svg"
}
