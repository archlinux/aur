# Maintainer: li0shang <li0shang@163.com>
pkgname="zed-cn"
pkgver=0.195.0
pkgrel=1
pkgdesc=" zed-loc (Zed 汉化) github-TC999/zed-loc"
arch=('x86_64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://github.com/TC999/zed-loc"
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TC999/zed-loc/releases/download/v$pkgver-pre/zed-linux-x86_64.tar.gz")
sha512sums=('SKIP')

# 解压源码包
prepare() {
  tar -xzf "$pkgname-$pkgver.tar.gz"
}

# 安装到 /opt
package() {
  # 创建目标目录
  install -d "$pkgdir/opt/$pkgname"
  
  # 复制所有文件到 /opt/软件名
  cp -r "$srcdir/zed-dev.app/"* "$pkgdir/opt/$pkgname/"
  
  # 设置权限（可选）
  # find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} \;
  # find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} \;
  
  # 如果需要：添加可执行文件到系统路径
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/zed" "$pkgdir/usr/bin/zed"
  # 安装图标文件夹
  if [ -d "$srcdir/zed-dev.app/share/icons" ]; then
    install -d "$pkgdir/usr/share/icons"
    cp -r "$srcdir/zed-dev.app/share/icons" "$pkgdir/usr/share/"
  fi
  # 如果需要：桌面文件
  install -Dm644 "$srcdir/zed-dev.app/share/applications/zed-dev.desktop" "$pkgdir/usr/share/applications/zed-cn.desktop"
}
