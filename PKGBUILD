# Maintainer: nlsdt <nlsdt@nlsdt.cc>

pkgname=pilinara-bin
_pkgname=pilinara
pkgver=2.1.0.2
pkgrel=3
url="https://github.com/Starfallan/PiliNara"
pkgdesc="PiliPlus 的第三方Fork版本，做了一些自用改动"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk3' 'mpv' 'libayatana-appindicator' 'webkit2gtk-4.1')
provides=('pilinara')
conflicts=('pilinara' 'pilinara-git')
options=('!debug' '!strip')

source_x86_64=("https://github.com/Starfallan/PiliNara/releases/download/2.1.0.2/PiliNara_linux_2.1.0+5673_amd64.tar.gz"
               "com.example.pilinara.desktop::https://raw.githubusercontent.com/Starfallan/PiliNara/main/assets/linux/com.example.pilinara.desktop")
sha256sums_x86_64=('4b8b60ecbb96a491c65f1e76832e39ed65010dce8028f81b7da571ef021e2912'
                   '457d3421b52aaa0646493ad49241b0af267821c7358d4d1f6aa9cb512ef29850')

package() {
  # 建立目录
  install -d "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  # 安装文件
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"
  cp -a "$srcdir/lib" "$pkgdir/opt/$_pkgname/"
  cp -a "$srcdir/data" "$pkgdir/opt/$_pkgname/"
  # 安装图标
  install -Dm644 "$srcdir/data/flutter_assets/assets/images/logo/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  # 安装 .desktop
  install -Dm644 "$srcdir/com.example.$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/com.example.$_pkgname.desktop"
  # 链接主程序
  ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
