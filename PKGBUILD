# Maintainer: Maksim Kurnosenko <asusx2@mail.ru>

pkgname=anylogic-university
pkgver=8.9.8
pkgrel=1
pkgdesc="AnyLogic University Edition - for public research in universities"
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
sha256sums=('8f35b47aab93e7759084b463c3b06c13bca1fcb2c1f556b5bef8d73d1ea1979f'
            'f0d4b44dd6f53d0aa940b730d1c0dfac77ab3aea4cca6ab185abc7e458a8c135')

prepare() {
    msg2 "Unpacking archive..."
    tail -n +511 "$srcdir/$pkgname-$pkgver.linux.x86_64.tgz.bin" > "$pkgname-$pkgver.linux.x86_64.tgz"

    msg2 "Extracting archive..."
    tar -xf $pkgname-$pkgver.linux.x86_64.tgz
}

package() {
    mkdir -p "$pkgdir/opt"

    msg2 "Copying AnyLogic University Edition contents..."
    cp -R "$srcdir/anylogic" "$pkgdir/opt"

    install -Dm644 "$srcdir/anylogic/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/anylogic/license/Software Licensing Agreement for AnyLogic.txt" "$pkgdir/usr/share/licenses/anylogic/LICENSE"
}
