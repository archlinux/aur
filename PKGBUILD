# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: VHSgunzo <vhsgunzo.github.io>

pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver=24.9.3.49057
pkgrel=2
pkgdesc='Official desktop application for the VK Teams messaging service'
arch=("x86_64")
url='https://teams.vk.com'
provides=("$pkgbasename")
conflicts=("$pkgbasename")
install=$pkgname.install
source=("$pkgbasename-$pkgver.tar.xz::https://dl.internal.myteam.mail.ru/downloads/linux/x64/$pkgver/$pkgbasename.tar.xz"
        "$pkgbasename.sh"
        "$pkgbasename.png")
sha256sums=('f2d079dd6a505dd3ad7addf911861dda0dc14bf9e96b98e1776b0632c8b2c2ee'
            'a2afc2dbd79e67736511c91b3d8f0a5fe3800c929ead9909d1b8f90fe7a7ca4b'
            'f4d3d9c11bcfd458a44f6e555bd753284b680c25977ddcfdf6039ea3ba65a75a')
options=('!strip')
optdepends=('hunspell: spell checker'
            'hunspell-ru: проверка орфографии')

shopt -s extglob

package() {
    install -dm755 "$pkgdir/opt/$pkgbasename"
    install -dm755 "$pkgdir/usr/bin"
    cp -ar --no-preserve=ownership "$srcdir"/!(${pkgbasename}.sh|${pkgbasename}.png) "$pkgdir/opt/$pkgbasename"
    rm -f "$pkgdir/opt/$pkgbasename/lib/libXcursor.so.1"
    rm -f "$pkgdir/opt/$pkgbasename/plugins/platforms/libqwayland-generic.so"
    install -Dm755 "../$pkgbasename.sh" "$pkgdir/usr/bin/$pkgbasename"
    install -Dm644 "../$pkgbasename.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgbasename.png"
}
