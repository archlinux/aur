# Maintainer: xmengnet <my@liyp.cc>

pkgname=quiet-md
pkgver=0.1.9
pkgrel=1
pkgdesc='本地优先的富文本笔记，GPUI 绘制，兼容飞书 DocxXML，可直接编辑 Markdown 文件'
arch=('x86_64')
url='https://quiet.md'
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
  'xdg-utils'
)
optdepends=(
  'noto-fonts: 界面字体（Noto Sans）'
  'noto-fonts-cjk: 中文界面和文档需要的 Noto Sans CJK'
  'xdg-desktop-portal: 打开、保存文件时的选择框'
)
makedepends=('rust' 'pkgconf' 'freetype2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/s1dashu/quiet-md/archive/v$pkgver.tar.gz"
        com.s1dashu.quietmd-48.png
        com.s1dashu.quietmd-64.png
        com.s1dashu.quietmd-128.png
        com.s1dashu.quietmd-256.png
        com.s1dashu.quietmd-512.png)
sha256sums=('ff3ef33137db2c61d9f3073cdb79bf821541fe8825e7c9172a4d79134fb41ae8'
            '63b00415e37f34af5aebdb7ae5a1b27b7f2e75989e81ea3f737f618f002beff2'
            'b3063a03af3a78d542a2b978ac022754e5975611168903a92800ab92bad12fcb'
            'e9df11d99c25190983f2985209512284a7f5d91b4e4d198da3b40faf1d685b08'
            'f882b2ccc378e3a3ac0a479d8e90b31210e6032654c3939308d6476413d31964'
            '0c93bdd0703f47be38f7c95d432198c198f08e207a1ea40af2b61ef75d8a5a37')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/quiet_md "$pkgdir/usr/bin/quiet_md"
  install -Dm644 packaging/linux/com.s1dashu.quietmd.desktop \
    "$pkgdir/usr/share/applications/com.s1dashu.quietmd.desktop"
  for size in 48 64 128 256 512; do
    install -Dm644 "$srcdir/com.s1dashu.quietmd-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.s1dashu.quietmd.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY.md"
}
