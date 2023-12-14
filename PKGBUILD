# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=firefox-tridactyl-native-bin
pkgver=1.24.0
_nativever=0.4.1
pkgrel=1
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('x86_64')
url=https://github.com/tridactyl/tridactyl
license=('Apache')
provides=('firefox-tridactyl-native')
conflicts=('firefox-tridactyl-native')
source=("https://github.com/tridactyl/native_messenger/releases/download/$_nativever/native_main-Linux"
        "https://raw.githubusercontent.com/tridactyl/native_messenger/$_nativever/tridactyl.json")
b2sums=('242271577086547f7ea261358113dc418e5f880adbb40f15ba96451e1a2844ca530818f6aeb4f2486185e9173dee17ce9c09970197cec14fefd2cf3c0b70f079'
        '1af6e9374ff2af3ac8b85c4e202d09a9b727115324b4a620d37e7db4aed291b5307b21fe4ea1d1d05c2055c84d1003b727edec84524ca4d513c847d20471f20c')

build() {
    sed -i -e "s-REPLACE_ME_WITH_SED-/usr/lib/tridactyl/native_main-" \
        "$srcdir/tridactyl.json"
}

package() {
    install -D -m755 "$srcdir/native_main-Linux" \
        "$pkgdir/usr/lib/tridactyl/native_main"
    install -D -m644 "$srcdir/tridactyl.json" \
        "$pkgdir/usr/lib/mozilla/native-messaging-hosts/tridactyl.json"
}
