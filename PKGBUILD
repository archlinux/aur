# Maintainer: liyp <my [at] liyp dot cc>
_pkgname=xc-music
pkgname=${_pkgname}-electron
pkgver=0.3.1
pkgrel=1
pkgdesc='第三方网易云音乐客户端（使用系统electron） / GUI of Netease Cloud Music'
arch=('x86_64')
url="https://github.com/yiktllw/XCMusic"
license=('MIT')
changelog=CHANGELOG.md
conflicts=('xc-music'
           'xc-music-bin'
           'xc-music-git')
depends=('electron')
source=("$_pkgname-$pkgver.asar::${url}/releases/download/$pkgver/app.asar"
        "$pkgname.sh"
        "$pkgname.desktop"
	"LICENSE::https://raw.githubusercontent.com/yiktllw/XCMusic/refs/heads/master/LICENSE"
	"icon.png::https://raw.githubusercontent.com/yiktllw/XCMusic/refs/tags/$pkgver/public/icons/icon.png"
	)
sha256sums=('62fd0f09c1567b084ecf748fdd9b1f22abb7fc3bbca373d9859c0d10bfa11341'
            'b16ffb6b054492882ce512b09a8d7dd72a5d8fab336c37eca490a9ab88f05d6a'
            '6dcddcada0bc96312ea2c1ae3ff86863ab0f97cf4c5c7f445c61f5a9418efd1f'
    	    '01cfa7209f94fbbc44d9b6946d94c75612cf3fbfb6950752af500ea1956664c0'
    	    'fe8892a2ff0b2bc5e815d2b590444899caf92f5c9ce8ae5c4b03ff24e640f3fa')

#build() {
#  cd "$srcdir/XCMusic-$pkgver"
#  npm install
#  npm run electron:build

#}
package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
  #cd "$srcdir/XCMusic-$pkgver"
  # 复制文件到包目录
  mkdir -p "$pkgdir/usr/lib/$pkgname"
  install -Dm644 $_pkgname-$pkgver.asar "$pkgdir/usr/lib/$pkgname/app.asar"
#   install -Dm755 dist_electron/linux-unpacked/* -t "$pkgdir/opt/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  # Install icons
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
