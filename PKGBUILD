# Maintainer: Maksim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-ple
pkgver=8.9.1
pkgrel=1
pkgdesc="AnyLogic Personal Learning Edition - for beginners and students"
arch=(x86_64)
url="https://www.anylogic.com"
license=('custom')
depends=('glibc')
optdepends=('chromium: alternative browser for model animating'
            'firefox: alternative browser for model animating'
            'webkitgtk: it may be required because of libwebkitgtk-1.0 dependency (not building as of now, only binary)')
provides=('anylogic')
conflicts=('anylogic')
options=(!strip)
source=("https://files.anylogic.com/$pkgname-$pkgver.linux.x86_64.tgz.bin"
        "$pkgname.desktop")
sha256sums=('ffe11605522cf399f1d9d7dab569f572df5dd0cd0864a24b9cbb827101e9921f'
            'e4ba5ff1344d0a60fa8625739fe442c5b9c995fb51c1cd48839291abf6a8bf55')

prepare() {
    msg2 "Unpacking archive..."
    tail -n +511 "$srcdir/$pkgname-$pkgver.linux.x86_64.tgz.bin" > "$pkgname-$pkgver.linux.x86_64.tgz"

    msg2 "Extracting archive..."
    tar -xf $pkgname-$pkgver.linux.x86_64.tgz
}

package() {
    mkdir -p "$pkgdir/opt"

    msg2 "Copying AnyLogic Personal Learning Edition contents..."
    cp -R "$srcdir/anylogic" "$pkgdir/opt"

    install -Dm644 "$srcdir/anylogic/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/anylogic/license/Software Licensing Agreement for AnyLogic.txt" "$pkgdir/usr/share/licenses/anylogic/LICENSE"
}
