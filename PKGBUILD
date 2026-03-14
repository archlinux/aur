# Maintainer: gimletlove

pkgname=imagecompare-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Image Comparison Program with various helpful features and tools.'
arch=('x86_64')
url='https://github.com/gimletlove/imagecompare'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'libvips' 'hicolor-icon-theme' 'kcoreaddons')
optdepends=(
  'libjxl: JPEG XL image support'
  'libheif: HEIF and HEIC image support'
)
provides=('imagecompare')
conflicts=('imagecompare')
source=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/$pkgver/imagecompare-linux-$pkgver.zip")
noextract=("$pkgname-$pkgver-x86_64.zip")
sha256sums=('0ce45430cb91364b83cb00217da0e388e2a086251646e33227704983d7d05731')

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

  install -Dm644 "$_extractdir/share/metainfo/io.github.gimletlove.imagecompare.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.gimletlove.imagecompare.metainfo.xml"
}
