# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: VHSgunzo <vhsgunzo.github.io>

pkgname='vk-workspace-bin'
pkgbasename='vkworkspace'
pkgver=26.4.0.141207
pkgrel=1
pkgdesc='VK WorkSpace app for team collaboration'
arch=("x86_64")
url='https://workspace.vk.ru/'
provides=("$pkgbasename" 'vkteams')
conflicts=("$pkgbasename" 'vkteams')
replaces=('vkteams-bin' 'vkteams')
install=$pkgname.install
source=("$pkgbasename-$pkgver.tar.xz::https://hb.bizmrg.com/vkteams-www/linux/x64/$pkgver/$pkgbasename.tar.xz"
        "$pkgbasename.sh")
sha256sums=('0eac2984a353dde5a97ec34abb7344c835321e2b9bd7dfebf7c60ecd63902d59'
            '1682a949a32b87b322c5490ec0ca380421a8a4c45d13948bac097986e02905bb')
options=('!strip')
optdepends=('hunspell: spell checker'
            'hunspell-ru: проверка орфографии')

package() {
    install -dm755 "$pkgdir/opt/$pkgbasename"
    install -dm755 "$pkgdir/usr/bin"
    cp -rP $srcdir/. "$pkgdir/opt/$pkgbasename"

    # remove all symlinks
    for file in $pkgdir/opt/$pkgbasename/*; do
        if [[ -L $file ]]; then
            rm -f $file
        fi
    done

    # use enviroment cursor
    rm -f "$pkgdir/opt/$pkgbasename/lib/libXcursor.so.1"

    install -Dm755 "../$pkgbasename.sh" "$pkgdir/usr/bin/$pkgbasename"
}
