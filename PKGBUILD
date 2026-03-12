# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: VHSgunzo <vhsgunzo.github.io>

pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver=26.1.10.79081
pkgrel=1
pkgdesc='VK Team app for team collaboration'
arch=("x86_64")
url='https://teams.vk.com'
provides=("$pkgbasename")
conflicts=("$pkgbasename")
install=$pkgname.install
source=("$pkgbasename-$pkgver.tar.xz::https://hb.bizmrg.com/vkteams-www/linux/x64/$pkgver/vkworkspace.tar.xz"
        "$pkgbasename.sh")
sha256sums=('2934ce988d3f814b649b6d259866380c227d9dc849a0683636499b72959782bf'
            '386d38d3b81531c478d65832816b604a5cf28b18b6c0b999933e0a7775ed84bf')
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
