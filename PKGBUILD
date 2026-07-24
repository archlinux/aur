# Maintainer: gimletlove

pkgname=imagecompare-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Image Compare lets you inspect two or more images side by side, in a stacked view, or with a heatmap of perceptual differences. With various other helpful features.'
arch=('x86_64')
url='https://github.com/gimletlove/imagecompare'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'libvips' 'hicolor-icon-theme')
optdepends=(
  'libjxl: JPEG XL image support'
  'libheif: HEIF and HEIC image support'
)
provides=('imagecompare')
conflicts=('imagecompare')
source=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/imagecompare-$pkgver-linux-x86_64.zip")
noextract=("$pkgname-$pkgver-x86_64.zip")
sha256sums=('e4ba0932b93f02c881a3681094caea67bf169b6e1ef2e741bfc6194b6a2d2681')

package() {
  local _archive="$srcdir/$pkgname-$pkgver-x86_64.zip"
  local _extractdir="$srcdir/extract"
  local _prefix="$_extractdir/linux"

  rm -rf "$_extractdir"
  install -d "$_extractdir"

  bsdtar -xf "$_archive" -C "$_extractdir"

  install -Dm755 "$_prefix/bin/imagecompare" \
    "$pkgdir/usr/bin/imagecompare"

  install -Dm644 "$_prefix/share/applications/io.github.gimletlove.imagecompare.desktop" \
    "$pkgdir/usr/share/applications/io.github.gimletlove.imagecompare.desktop"

  install -Dm644 "$_prefix/share/icons/hicolor/scalable/apps/io.github.gimletlove.imagecompare.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.gimletlove.imagecompare.svg"

  install -Dm644 "$_prefix/share/metainfo/io.github.gimletlove.imagecompare.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.gimletlove.imagecompare.metainfo.xml"
}
