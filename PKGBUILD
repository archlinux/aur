# Maintainer: justbispo <aur.fyxy0@slmail.me>
# Maintainer: budRich of budlabs

pkgname=vivaldi-autoinject-custom-js-ui
pkgver=2026.05.15
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
sha256sums=('2189fea24175d2265bd317eea2166a43b5949a214b73eb1332df3a5ba49f6a17'
            '3564099604ef8f38d7fe9ec7672b9c3175e6ed11e06e39b5f53f9201ad93127f')

package() {
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" vivaldi-js-ui.hook
    cd "${pkgname}-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
