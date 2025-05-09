pkgname=xc-music
pkgver=0.3.1
pkgrel=3
pkgdesc='第三方网易云音乐客户端 / GUI of Netease Cloud Music'
arch=('x86_64')
url="https://github.com/yiktllw/XCMusic"
license=('MIT')
# depends=('electron13-bin')
depends=('npm')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('dfe80a7d60ae6e400896d36e2de437a08ae3a99b06714d4161bd4bfbc9a155a9'
            'c31264219d2bf17ac2650aab36c68e06586fd3794517741e34f7c78cba72035b'
            '322306532f7c9964d21fddd5c1286f793bf72fac3bd1a6dbd59f3ec07998afcb')

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
