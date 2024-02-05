# Maintainer: justbispo <aur.fyxy0@slmail.me>
# Maintainer: budRich of budlabs

pkgname=vivaldi-autoinject-custom-js-ui
pkgver=2023.09.05.1
pkgrel=1
pkgdesc='manage custom js UI mods for the vivaldi web browser'
arch=('any')
url='https://github.com/budlabs/vivaldi-autoinject-custom-js-ui'
license=('BSD')
depends=('bash' 'sed' 'vivaldi')
makedepends=(gawk go-md2man m4)

source=(
  "$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz"
  # "${pkgname}-$pkgver::git+file:///home/bud/tmp/vivaldi-autoinject-custom-js-ui"
  vivaldi-js-ui.hook
  install.bash
)

sha256sums=('92c00cd5e6fa226266ce22cc9f7f304412651289edd70b87797f2929e9cbb1ae'
            '3564099604ef8f38d7fe9ec7672b9c3175e6ed11e06e39b5f53f9201ad93127f'
            '40102cc1d69406726de3bd922717587d4f3260276eb7532dd49fffe316f2e0b5')

package() {

  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" vivaldi-js-ui.hook

  cd "${pkgname}-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
