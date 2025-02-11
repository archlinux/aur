# Maintainer: CoutCin <cout.cin.xw@gmail.com>
pkgname=cherry-studio-git-c
pkgver=0.9.21
pkgrel=3
pkgdesc="Cherry Studio支持多服务商集成的AI对话客户端"
arch=('x86_64')
url="https://cherry-ai.com/"
license=("apache-2.0")
depends=('fuse2')
options=('!strip')
source=("$pkgname-$pkgver.AppImage::https://github.com/CherryHQ/cherry-studio/releases/download/v$pkgver/Cherry-Studio-$pkgver-x86_64.AppImage"
        "Cherry-Studio.desktop")
sha512sums=('8caf857ab4506a689bd652e61225e1ba252a7f04812a3291170dc959b67a27266890a3c5c3318c1494aa425409a6b6c275ece18438043388a887550b4e037882' 'SKIP')

prepare() {
  chmod +x "$pkgname-$pkgver.AppImage"

}

package() {
  # 安装 AppImage
  install -Dm755 "$pkgname-$pkgver.AppImage" "$pkgdir/opt/Cherry-Studio/Cherry-Studio.AppImage"

  ./$pkgname-$pkgver.AppImage --appimage-extract
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0/apps/cherrystudio.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Cherry-Studio.png"
  rm -rf squashfs-root

  # 创建启动器链接（可选）
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Cherry-Studio/Cherry-Studio.AppImage" "$pkgdir/usr/bin/Cherry-Studio"

  # 安装桌面文件
  install -Dm644 "Cherry-Studio.desktop" "$pkgdir/usr/share/applications/Cherry-Studio.desktop"
}
