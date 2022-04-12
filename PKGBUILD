# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=firefox-tridactyl-native-bin
pkgver=1.22.1
_nativever=0.3.6
pkgrel=1
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('x86_64')
url=https://github.com/tridactyl/tridactyl
license=('Apache')
provides=('firefox-tridactyl-native')
conflicts=('firefox-tridactyl-native')
source=("https://github.com/tridactyl/native_messenger/releases/download/$_nativever/native_main-Linux"
        "https://raw.githubusercontent.com/tridactyl/native_messenger/$_nativever/tridactyl.json")
b2sums=('10f02fe35309e36229fa1de2b92e5ad6c624c703cdc901ef19c69d97e06a4c4256e9fb95b8b349e15be84e3e23fc88186630475545fced28d6ffc0af1c454305'
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
