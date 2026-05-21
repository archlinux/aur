# Maintainer: justbispo <aur.fyxy0@slmail.me>
# Maintainer: budRich of budlabs

pkgname=vivaldi-autoinject-custom-js-ui
pkgver=2026.05.21
pkgrel=1
pkgdesc='manage custom js UI mods for the vivaldi web browser'
arch=('any')
url='https://github.com/justbispo/vivaldi-autoinject-custom-js-ui'
license=('BSD')
depends=('bash' 'sed' 'vivaldi')
makedepends=(gawk go-md2man m4)
install=vivaldi-autoinject-custom-js-ui.install
source=(
    "$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz"
    vivaldi-js-ui.hook
)
sha256sums=('a22e87cc9a7c554a0921e9835b4094a25cf85f5e4a4774b447bc6079b365f76a'
            '3564099604ef8f38d7fe9ec7672b9c3175e6ed11e06e39b5f53f9201ad93127f')

package() {
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" vivaldi-js-ui.hook
    cd "${pkgname}-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
