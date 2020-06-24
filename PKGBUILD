pkgname=radical-native-bin
_name=radical-native
pkgver=0.1beta15
pkgrel=1
epoch=1
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

sha512sums=('d52ce5705e6d62bdb6ecb74898877126fee2ee4124bce663ed636c9add886c6b1ca13ab82043144c3dbe073bc9a7c42098cbf67602c3a56a64085e51cf001e39'
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