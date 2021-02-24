# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=firefox-tridactyl-native
pkgver=1.21.0
_nativever=0.2.5
pkgrel=1
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('any')
url=https://github.com/tridactyl/tridactyl
license=('Apache')
depends=('python')
source=("https://github.com/tridactyl/native_messenger/releases/download/$_nativever/native_main-Linux"
        "https://raw.githubusercontent.com/tridactyl/native_messenger/$_nativever/tridactyl.json")
b2sums=('bdbb85035d33096395396414277b9c00a2c67e517271a31bdc9cef122bb1730f08c31ab21d4f7c7ad51ab09cf6153d4ca3b8890c61469298bc3984dd5c034b23'
        '1af6e9374ff2af3ac8b85c4e202d09a9b727115324b4a620d37e7db4aed291b5307b21fe4ea1d1d05c2055c84d1003b727edec84524ca4d513c847d20471f20c')

build() {
    sed -i -e "s-REPLACE_ME_WITH_SED-/usr/lib/tridactyl/native_main-" \
        "$srcdir/tridactyl.json"
}

package() {
    install -d "$pkgdir/usr/lib/tridactyl"
    install -m 0755 "$srcdir/native_main-Linux" \
        "$pkgdir/usr/lib/tridactyl/native_main"
    install -d "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -m 0644 "$srcdir/tridactyl.json" \
        "$pkgdir/usr/lib/mozilla/native-messaging-hosts/tridactyl.json"
}
