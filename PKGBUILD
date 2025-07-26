# Maintainer: OrPudding <t3164473115@163.com>
pkgname=astro-box
pkgver=1.0.2
pkgrel=3
pkgdesc="A multifunctional toolbox designed for Xiaomi Vela wearable devices"
arch=('x86_64')
url="https://astrobox.online/"
license=('AGPL3')
depends=('webkit2gtk' 'gtk3')
options=('!debug')
source=("https://vip.123pan.cn/1811888703/AstroBox/AstroBox_${pkgver}_amd64.deb")
sha256sums=('65afbde3ad0436a7cbeb33184ac9896e33a71a17a09c3445855d44b59df5ae7c')

prepare() {
  # 提取deb包中的数据
  ar x AstroBox_${pkgver}_amd64.deb
  tar -xf data.tar.gz
}

package() {
  # 复制主程序
  install -Dm755 usr/bin/Astro-Box "$pkgdir/usr/bin/Astro-Box"

  # 复制桌面文件 (直接从deb包中提取)
  install -Dm644 usr/share/applications/AstroBox.desktop \
    "$pkgdir/usr/share/applications/AstroBox.desktop"

  # 复制图标
  for size in 32x32 128x128 256x256@2; do
    install -Dm644 usr/share/icons/hicolor/$size/apps/Astro-Box.png \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/Astro-Box.png"
  done
}
