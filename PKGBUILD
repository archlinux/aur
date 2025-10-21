# Maintainer: li0shang <li0shang@163.com>
pkgname="zed-cn"
pkgver=20251020
_path="zed-dev"
pkgrel=1
pkgdesc="zed-loc (Zed 汉化) github-TC999/zed-loc"
arch=('x86_64')
license=("custom:Copyright (c) 2015 Abner Lee All Rights Reserved.")
url="https://github.com/TC999/zed-loc"
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TC999/zed-loc/releases/download//zed-linux-x86_64.tar.gz")
sha512sums=('6105cc8f1503500531bcfbe507dfb1be1b07322a72b6c6726a9185e700c7d92ca5b4a35ec643572108985699f3d9cea271790413cb5be9c8f3169557b7f2fb81')

prepare() {
  tar -xzf "$pkgname-$pkgver.tar.gz"
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$_path.app/"* "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/zed" "$pkgdir/usr/bin/zed"
  _icon_sizes=("512x512" "1024x1024")
  for size in "${_icon_sizes[@]}"; do
    if [ -f "$srcdir/$_path.app/share/icons/hicolor/$size/apps/zed.png" ]; then
      install -Dm644 "$srcdir/$_path.app/share/icons/hicolor/$size/apps/zed.png" \
        "$pkgdir/usr/share/icons/hicolor/$size/apps/zed-cn.png"
    fi
  done
  install -Dm644 "$srcdir/$_path.app/share/applications/$_path.desktop" "$pkgdir/usr/share/applications/zed-cn.desktop"
  find "$pkgdir" -name "*.debug" -delete
  strip --strip-all "$pkgdir/opt/$pkgname/bin/zed" 2>/dev/null || true
  strip --strip-all "$pkgdir/opt/$pkgname/libexec/zed-editr" 2>/dev/null || true
}
options=('!debug')
