pkgname=radical-native-bin
_name=radical-native
pkgver=0.1beta14
pkgrel=1
pkgdesc='Extending Riot Web with native capabilities'
arch=('x86_64')
license=('MIT')
depends=('sqlcipher'
         'libsecret')
_repo="stoically/$_name"
url="https://github.com/$_repo"
_rawurl="https://raw.githubusercontent.com/$_repo"
source=("$url/releases/download/v$pkgver/${_name}_v${pkgver}_x86-amd64.deb"
        "$_rawurl/v$pkgver/LICENSE")

sha512sums=('ea0249ce92c7a9ba7c33d70bfbfc5dfeb4b407ce9292a327538bd578b3b73800e7b1588d84bb0806ad98a9691dacd8a39dcd2e73f2a01ff6a8c378b261ea8d6e'
            '4b7ddd854dff49b640b8dad9b8bb7cda64ed02a1aa4f0299498a57fe372e042f4969e2e2bfa2449064e8c9bfb8909d8f4e6644365672a819b61c324302130049')

package() {
    cd "${srcdir}"

    mkdir -p data
    tar -xaf data.tar.xz -C data

    install -Dm755 "data/usr/bin/radical-native" "$pkgdir/usr/bin/radical-native"
    install -Dm644 "data/usr/lib/mozilla/native-messaging-hosts/radical.native.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/radical.native.json"
    install -Dm644 "data/usr/share/doc/radical-native/copyright" "$pkgdir/usr/share/doc/radical-native/copyright"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}