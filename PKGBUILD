# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pomchat-bin
pkgver=0.4.2
pkgrel=1
provides=('pomchat')
conflicts=('pomchat')
pkgdesc='通过本地音频 + ASS字幕实现即时通讯聊天渲染并导出视频的桌面工具'
arch=('x86_64')
url='https://github.com/AlanWanco/PomChat'
license=('MIT')
makedepends=('imagemagick')
source=(
    "$url/releases/download/v$pkgver/PomChat-$pkgver-linux-x64.tar.gz"
    "$url/raw/refs/tags/v$pkgver/LICENSE"
    "pomchat.desktop"
)
sha256sums=('7370142372b64df1ffc34e0284d0e8de4dfe00ce270b0eea75850e5d87766a5a'
            '6f83a3354bd403442a0391078b470b471c611157c5246061367ba9a93dd34836'
            '0440b7b0ecf812c826c12693f37eae6d7f1703130bd8409a8af170e2719c667f')

prepare() {
    magick ./PomChat-*/resources/app/dist/pomchat-icon.png -resize 512x512 pomchat.png
}

package() {
    install -Dm 644 LICENSE ./PomChat-*/LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 pomchat.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -Dm 644 pomchat.desktop -t "$pkgdir/usr/share/applications"
    install -d "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -a ./PomChat-*/ "$pkgdir/opt/pomchat"
    ln -s /opt/pomchat/pomchat "$pkgdir/usr/bin/"
}
