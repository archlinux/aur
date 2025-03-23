_pkgname=xc-music
pkgname=${_pkgname}-electron
pkgver=0.3.0
pkgrel=2
pkgdesc='第三方网易云音乐客户端（使用系统electron） / GUI of Netease Cloud Music'
arch=('x86_64')
url="https://github.com/yiktllw/XCMusic"
license=('MIT')
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
sha256sums=('1f8e4da8c1eee8ccc87fc93d8970ee4a13e01eb39166ee19fc01da239952059c'
            'b16ffb6b054492882ce512b09a8d7dd72a5d8fab336c37eca490a9ab88f05d6a'
            '99af5594bd7146b593f5f9ac7984e80e566d38787bd440dc8a06b0686e850036'
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
