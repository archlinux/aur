# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: VHSgunzo <vhsgunzo.github.io>

pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver=25.3.1.60267
pkgrel=1
pkgdesc='VK Team app for team collaboration'
arch=("x86_64")
url='https://teams.vk.com'
provides=("$pkgbasename")
conflicts=("$pkgbasename")
install=$pkgname.install
source=("$pkgbasename-$pkgver.tar.xz::https://vkteams-www.hb.bizmrg.com/linux/x64/$pkgver/$pkgbasename.tar.xz"
        "$pkgbasename.sh"
        "$pkgbasename.png")
sha256sums=('fd95a6bbd884a7b3f2e41aaaa56afb6daef8d23c6baa63ce5fbf58f80aa6e5f2'
            'a2afc2dbd79e67736511c91b3d8f0a5fe3800c929ead9909d1b8f90fe7a7ca4b'
            'f4d3d9c11bcfd458a44f6e555bd753284b680c25977ddcfdf6039ea3ba65a75a')
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
    install -Dm644 "../$pkgbasename.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgbasename.png"
}
