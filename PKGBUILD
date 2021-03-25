# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=firefox-tridactyl-native
pkgver=1.21.1
_nativever=0.3.4
pkgrel=1
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('any')
url=https://github.com/tridactyl/tridactyl
license=('Apache')
depends=('python')
source=("https://github.com/tridactyl/native_messenger/releases/download/$_nativever/native_main-Linux"
        "https://raw.githubusercontent.com/tridactyl/native_messenger/$_nativever/tridactyl.json")
b2sums=('11a2ef497b1b832c28c428a36737194a567d578e46daf2872ffcc5a2d2d24a2b0ff3156f00e067e577b8dfed33878a222f83fa85a52fe556e8dbf0e7d56d57e3'
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
