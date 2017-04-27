# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_gitname="jalv_select"
pkgname="jalv-select"
pkgver=0.8
pkgrel=2
pkgdesc="A little GUI to select installed LV2 plug-ins and run them with jalv."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/jalv_select"
license=('custom:Public Domain')
depends=('jalv' 'gtkmm')
source=("https://github.com/brummer10/${_gitname}/archive/V${pkgver}.tar.gz"
        'LICENSE.txt')
install="${pkgname}.install"
md5sums=('f7e3b16e5b8318c8ad09faa5dca532fa'
         '039bcb549d34b4273393c9ca25848fe6')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  make -j 1
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  make install DESTDIR="$pkgdir"

  # readme
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  # license
  install -Dm644 "$srcdir/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
