pkgname=xc-music
pkgver=0.3.0
pkgrel=1
pkgdesc='第三方网易云音乐客户端 / GUI of Netease Cloud Music'
arch=('x86_64')
url="https://github.com/yiktllw/XCMusic"
license=('MIT')
# depends=('electron13-bin')
depends=('npm')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('456357204a594106d7cb99c81bdb03c13e578e961c92ababab94623d9fbd2d11'
            '5fc0dc27c5823a55e71edcf9000c2bf111934d377510b8fcd2f4fbd672e38548'
            'ada2276598f790356c2288178035202c79a7c863550d911f9e1b5c7c95d1152b')

build() {
  cd "$srcdir/XCMusic-$pkgver"
  npm install
  npm run electron:build

}
package() {
  install -Dm755 xc-music.sh "$pkgdir/usr/bin/xc-music"
  install -Dm644 xc-music.desktop -t "$pkgdir/usr/share/applications/"
  cd "$srcdir/XCMusic-$pkgver"
  # 复制文件到包目录
  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r dist_electron/linux-unpacked/* "$pkgdir/usr/lib/$pkgname/"
#   install -Dm755 dist_electron/linux-unpacked/* -t "$pkgdir/opt/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  # Install icons
  install -Dm644 public/icons/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/xc-music.png"
}
