# Maintainer: Jeason <xiaomiquan@aliyun.com>

pkgname=novel-editor-bin
pkgver=0.1.80
pkgrel=1
pkgdesc="Professional novel writing application with advanced project management and world-building tools (binary)"
arch=('x86_64')
url="https://github.com/jeasoncc/novel-editor"
license=('MIT')
depends=(
  'webkit2gtk'
  'gtk3'
  'libappindicator-gtk3'
)
provides=('novel-editor')
conflicts=('novel-editor')
source=(
  "$pkgname-$pkgver.deb::https://github.com/jeasoncc/novel-editor/releases/download/desktop-v0.1.80/novel-editor_0.1.80_amd64.deb"
)
sha256sums=('SKIP')  # 首次发布时使用 SKIP，之后更新为实际的 SHA256

prepare() {
  # 提取 DEB 包
  cd "$srcdir"
  ar x "$pkgname-$pkgver.deb"
  
  # 检查数据文件格式并解压
  if [ -f data.tar.xz ]; then
    tar -xf data.tar.xz
  elif [ -f data.tar.gz ]; then
    tar -xf data.tar.gz
  elif [ -f data.tar.zst ]; then
    tar -xf data.tar.zst
  else
    echo "Error: No supported data archive found"
    exit 1
  fi
}

package() {
  cd "$srcdir"
  
  # 复制所有文件到目标目录
  cp -r usr "$pkgdir/"
  
  # 确保二进制文件有执行权限
  chmod +x "$pkgdir/usr/bin/novel-editor"
}