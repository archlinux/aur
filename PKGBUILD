# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pomchat-bin
pkgver=0.3.9
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
sha256sums=('d5ffea3a24a6f87f7ea84054322c446b5732394c729bbf7a4a642891a6854526'
            '6f83a3354bd403442a0391078b470b471c611157c5246061367ba9a93dd34836'
            'bbb4a78e14219083cc315443c5a872635c4e739a2afa3a45fde39424801d16d1')

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
