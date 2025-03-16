# Maintainer: aarto <aarto@aur.archlinux.org>

pkgname=librewolf-tridactyl-native-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Tridactyl native messaging host application for Librewolf'
arch=('x86_64' 'aarch64' 'arm7h')
url=https://github.com/tridactyl/tridactyl
license=('BSD-2-Clause')
depends=('glibc')
source=("https://raw.githubusercontent.com/tridactyl/native_messenger/$pkgver/tridactyl.json"
        "https://raw.githubusercontent.com/tridactyl/native_messenger/$pkgver/LICENSE")
source_x86_64=("https://github.com/tridactyl/native_messenger/releases/download/$pkgver/native_main-Linux")
source_aarch64=("https://github.com/tridactyl/native_messenger/releases/download/$pkgver/native_main-arm64-Linux")
source_arm7h=("https://github.com/tridactyl/native_messenger/releases/download/$pkgver/native_main-armhf-Linux")
b2sums=('1af6e9374ff2af3ac8b85c4e202d09a9b727115324b4a620d37e7db4aed291b5307b21fe4ea1d1d05c2055c84d1003b727edec84524ca4d513c847d20471f20c'
        'f1061dc448e2c91ed7f7d85c5c319e024f6dc66e8d92e18da0317f06a714b37401bbd48af2d1a6ed514a63d37dc3231ee92b837f509eb68596fa327f44aa2c86')
b2sums_x86_64=('8f998096aa8fc8c27dffcd3feed0fb9164ef91e1192ba0a4f9e6589e521478173f1d6513861c398500a41c54a15faa54d39b9369dccf5f97e1396ccc30f9a392')
b2sums_aarch64=('498b46e23d0b19e861ec77d1c48718050963588ccd505e286841cd0cef3fe6cfeffbb385da33c5cca5c8c1472b6c73d69dede215df74d97958e9b75199faf98d')
b2sums_arm7h=('d6c1ec142103177992af373e225d0238670981dfb8850ecbea664e1f97238966d4712a5893eba0baea18448b2959e966bebd8f22eeb3c95788454fbcb4db79dd')

build() {
    sed -i 's|REPLACE_ME_WITH_SED|/usr/lib/tridactyl/native_main|' \
        "$srcdir/tridactyl.json"
}

package() {
    install -D -m755 "$srcdir/native"* "$pkgdir/usr/lib/tridactyl/native_main"
    install -D -m644 "$srcdir/tridactyl.json" \
        "$pkgdir/usr/lib/librewolf/native-messaging-hosts/tridactyl.json"
    install -D -m644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
