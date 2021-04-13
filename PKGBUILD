# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=pplink-bin
pkgver=5.2.1
pkgrel=2
pkgdesc="帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com/"
license=('custom')
depends=('electron11')
provides=("pplink")
options=('!strip' 'emptydirs')

source=('https://github.com/Brx86/yun/releases/download/2/pplink-bin.tar.zst'
        'pplink'
        'pplink.png'
        'pplink.desktop')

md5sums=('ca94d3d293df390a68c6d5b6fc901df6'
         'eb8b1134f8696720748a93c6954431dd'
         '42cdee25421b4a84c117228e3f1d868d'
         'fb027a0085e615613be9617d533938b9')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    mv pplink "$pkgname-$pkgver/"
    mv pplink.asar "$pkgname-$pkgver/"
    mv pplink.png "$pkgname-$pkgver/"
    mv pplink.desktop "$pkgname-$pkgver/"
    mv pplink.asar.unpacked "$pkgname-$pkgver/"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "pplink.desktop"
    install -Dm644 "pplink.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pplink.png"
    install -Dm644 "pplink.asar" "${pkgdir}/usr/share/pplink/pplink.asar"
    install -Dm755 "pplink" "${pkgdir}/usr/bin/pplink"
    cp -r pplink.asar.unpacked "${pkgdir}/usr/share/pplink/"
}
