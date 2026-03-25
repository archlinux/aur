# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer-bin
pkgver=1.2.1
pkgrel=3
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
source_x86_64=("coomer-v$pkgver-linux-x86_64.AppImage::https://github.com/yuzujr/coomer/releases/download/v$pkgver/coomer-v$pkgver-linux-x86_64.AppImage")
source_aarch64=("coomer-v$pkgver-linux-aarch64.AppImage::https://github.com/yuzujr/coomer/releases/download/v$pkgver/coomer-v$pkgver-linux-aarch64.AppImage")
sha256sums=(
  '4736f70e8353dc8df73e186c6fa7b44e3dd040de0d9d2efc6b606ffb70544df6'
  'c28862c404c04b1ae16d56dbf27113e3df9dfbee0d96d1f8a8f8ca919de3be1c'
  'e0f1033118fa22c655e0b6ae7ad4ea8268a5f710d2afadea9508e0d13fda9b53'
  '02cb433214e94fe75bd94ff9c380eeffa2138de6f36d28db2a85bd7c742eace9'
)
sha256sums_x86_64=('d06036dfa8bfffe68d5646d653d0cf1938669bafce4c38921be0d93563a6e499')
sha256sums_aarch64=('a6ac10b55f8bec2bb6222bcb32234628ced5161171acfe78a779b295cc4a9c44')
noextract=(
  "coomer-v$pkgver-linux-x86_64.AppImage"
  "coomer-v$pkgver-linux-aarch64.AppImage"
)

package() {
  cd "$srcdir"
  local _appimage="coomer-v$pkgver-linux-$CARCH.AppImage"

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
