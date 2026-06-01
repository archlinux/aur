# Maintainer: Softer <softer@lin.in.ua>
pkgname=razer-tray-bin
_pkgname=razer-tray
pkgver=0.6.2
pkgrel=1
pkgdesc='Minimal Linux tray indicator for Razer wireless mouse and keyboard battery level (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Softer/razer-tray'
license=('MIT')
depends=('gcc-libs' 'dbus' 'openrazer-driver-dkms')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("https://github.com/Softer/razer-tray/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH.tar.gz")
sha256sums=('aebd125c21fa8e8afe7bc29b8f3d82ace42ca2d5a30b8173a4d104ec9de5f4c8')

package() {
    cd "$_pkgname-$pkgver"

    install -Dm755 "$_pkgname" \
        "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$_pkgname.service" \
        "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
    install -Dm644 "$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "99-$_pkgname.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-$_pkgname.rules"
    install -Dm755 "$_pkgname-udev-trigger.sh" \
        "$pkgdir/usr/lib/$_pkgname/udev-trigger"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$_pkgname/README.md"

    install -d "$pkgdir/usr/share/$_pkgname/icons"
    install -m644 icons/*.png "$pkgdir/usr/share/$_pkgname/icons/"
}
