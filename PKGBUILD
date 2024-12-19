# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# shellcheck disable=SC2034,SC2154
pkgname=firefox-tridactyl-native-bin
pkgver=1.24.2
_nativever=0.5.0
pkgrel=1
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('x86_64')
url=https://github.com/tridactyl/tridactyl
license=('BSD-2-Clause')
depends=('glibc')
provides=('firefox-tridactyl-native')
conflicts=('firefox-tridactyl-native')
source=("https://github.com/tridactyl/native_messenger/releases/download/$_nativever/native_main-Linux"
        "https://raw.githubusercontent.com/tridactyl/native_messenger/$_nativever/tridactyl.json"
        "https://raw.githubusercontent.com/tridactyl/native_messenger/$_nativever/LICENSE")
b2sums=('8f998096aa8fc8c27dffcd3feed0fb9164ef91e1192ba0a4f9e6589e521478173f1d6513861c398500a41c54a15faa54d39b9369dccf5f97e1396ccc30f9a392'
        '1af6e9374ff2af3ac8b85c4e202d09a9b727115324b4a620d37e7db4aed291b5307b21fe4ea1d1d05c2055c84d1003b727edec84524ca4d513c847d20471f20c'
        'f1061dc448e2c91ed7f7d85c5c319e024f6dc66e8d92e18da0317f06a714b37401bbd48af2d1a6ed514a63d37dc3231ee92b837f509eb68596fa327f44aa2c86')

build() {
    sed -i -e "s-REPLACE_ME_WITH_SED-/usr/lib/tridactyl/native_main-" \
        "$srcdir/tridactyl.json"
}

package() {
    install -D -m755 "$srcdir/native_main-Linux" \
        "$pkgdir/usr/lib/tridactyl/native_main"
    install -D -m644 "$srcdir/tridactyl.json" \
        "$pkgdir/usr/lib/mozilla/native-messaging-hosts/tridactyl.json"
    install -D -m644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
