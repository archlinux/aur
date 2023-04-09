# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-ple
pkgver=8.8.2
pkgrel=1
pkgdesc="AnyLogic Personal Learning Edition - for beginners and students"
arch=(x86_64)
url="https://www.anylogic.com"
license=('custom')
depends=('glibc')
optdepends=('chromium: alternative browser for model animating'
            'firefox: alternative browser for model animating')
provides=('anylogic')
conflicts=('anylogic')
options=(!strip)
source=("https://files.anylogic.com/$pkgname-$pkgver.linux.x86_64.tgz.bin"
        "$pkgname.desktop")
sha256sums=('97fdcac86b38d3888341513e29b3a715ded47b2faef18e8707f9066cb0136758'
            'e4ba5ff1344d0a60fa8625739fe442c5b9c995fb51c1cd48839291abf6a8bf55')

prepare() {
    msg2 "Unpacking archive..."
    tail -n +374 "$srcdir/$pkgname-$pkgver.linux.x86_64.tgz.bin" > "$pkgname-$pkgver.linux.x86_64.tgz"

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
