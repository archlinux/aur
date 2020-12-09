# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-ple
pkgver=8.7.0
pkgrel=1
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
sha256sums=('8e8b276fea97b8f8e8eab698d6461f2e091b1f32078235a22b2bc8b957e262d4')

prepare() {
    msg2 "Unpacking archive..."
    tail -n +377 "$srcdir/$pkgname-$pkgver.linux.x86_64.tgz.bin" > "$pkgname-$pkgver.linux.x86_64.tgz"

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
