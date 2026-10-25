# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Zoomer application for everyone on Linux (prebuilt AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/coomer"
license=('MIT')
depends=(
  'glibc'
  'fuse2'
)
options=('!strip' '!debug')

optdepends=(
  'xdg-desktop-portal: portal screenshot backend'
)

provides=('coomer')
conflicts=('coomer')

source=(
  "coomer.LICENSE::https://raw.githubusercontent.com/yuzujr/coomer/v$pkgver/LICENSE"
  "coomer.desktop::https://raw.githubusercontent.com/yuzujr/coomer/v$pkgver/packaging/linux/coomer.desktop"
  "coomer.svg::https://raw.githubusercontent.com/yuzujr/coomer/v$pkgver/packaging/linux/coomer.svg"
  "io.github.yuzujr.coomer.metainfo.xml::https://raw.githubusercontent.com/yuzujr/coomer/v$pkgver/packaging/linux/io.github.yuzujr.coomer.metainfo.xml"
)
source_x86_64=("coomer-v$pkgver-x86_64.AppImage::https://github.com/yuzujr/coomer/releases/download/v$pkgver/coomer-v$pkgver-x86_64.AppImage")
source_aarch64=("coomer-v$pkgver-aarch64.AppImage::https://github.com/yuzujr/coomer/releases/download/v$pkgver/coomer-v$pkgver-aarch64.AppImage")
sha256sums=('4736f70e8353dc8df73e186c6fa7b44e3dd040de0d9d2efc6b606ffb70544df6'
            'c28862c404c04b1ae16d56dbf27113e3df9dfbee0d96d1f8a8f8ca919de3be1c'
            'e0f1033118fa22c655e0b6ae7ad4ea8268a5f710d2afadea9508e0d13fda9b53'
            '61e54ffa074c1d33229deb6aa40ccdf3e89779d2992896131195d55b79a16fee')
sha256sums_x86_64=('1789b1deb133e73a3da2b2f36cf75cc288f235244ce6dd4fe7459fd4dfaaf887')
sha256sums_aarch64=('2853976755eade759005671d2a13f9cff3912273ebced1b25a787f64e274ab12')
noextract=(
  "coomer-v$pkgver-x86_64.AppImage"
  "coomer-v$pkgver-aarch64.AppImage"
)

package() {
  cd "$srcdir"
  local _appimage="coomer-v$pkgver-$CARCH.AppImage"

  install -Dm755 "$_appimage" \
    "$pkgdir/opt/coomer/coomer.AppImage"

  install -Dm644 coomer.LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 coomer.desktop \
    "$pkgdir/usr/share/applications/coomer.desktop"

  install -Dm644 coomer.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/coomer.svg"

  install -Dm644 io.github.yuzujr.coomer.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.yuzujr.coomer.metainfo.xml"

  install -Dm755 /dev/stdin \
    "$pkgdir/usr/bin/coomer" <<'EOF'
#!/bin/sh
exec /opt/coomer/coomer.AppImage "$@"
EOF
}
