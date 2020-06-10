pkgname=radical-native-bin
_name=radical-native
pkgver=0.1.0beta13
pkgrel=4
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
noextract=("$_xpi")

sha512sums=('a6d190359ea6f7cf04928fd007c818e8d521576e0093af8a6f621cda98ebfd115a110aa44799c316ebe8bd861c1295366948d6bcaa928003c8cf35f1efabad98'
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