# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-ple
pkgver=8.4.0
pkgrel=5
pkgdesc="AnyLogic Personal Learning Edition - for beginners and students"
arch=(x86_64)
url="https://www.anylogic.com"
license=('custom')
depends=('glibc')
makedepends=('gendesk')
optdepends=('chromium: alternative browser for model animating'
            'firefox: alternative browser for model animating')
provides=('anylogic')
conflicts=('anylogic')
options=(!strip)
source=("https://files.anylogic.com/$pkgname-$pkgver.linux.x86_64.tgz.bin")
sha256sums=('4029bc645995ab6b81b234334f4cb00fbf8608fae05d0cd1fc91dfd701358b87')

prepare() {
    msg2 "Unpacking archive..."
    tail -n +347 "$srcdir/$pkgname-$pkgver.linux.x86_64.tgz.bin" > "$pkgname-$pkgver.linux.x86_64.tgz"

    msg2 "Extracting archive..."
    tar -xf $pkgname-$pkgver.linux.x86_64.tgz
}

package() {
    mkdir -p "$pkgdir/opt"

    msg2 "Copying AnyLogic Personal Learning Edition contents..."
    cp -R "$srcdir/anylogic" "$pkgdir/opt"

    msg2 "Creating .desktop file..."
    gendesk -q -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='AnyLogic Personal Learning Edition' --exec='env SWT_GTK3=0 UBUNTU_MENUPROXY= /opt/anylogic/anylogic'
    install -Dm644 "$srcdir/anylogic/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/anylogic/license/Software Licensing Agreement for AnyLogic.txt" "$pkgdir/usr/share/licenses/anylogic/LICENSE"
}
