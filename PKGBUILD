# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_gitname="jalv_select"
pkgname="jalv-select"
pkgver=0.7
pkgrel=1
pkgdesc="A little GUI to select installed LV2 plug-ins and run them with jalv."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/jalv_select"
license=('custom:Public Domain')
depends=('jalv' 'gtkmm')
source=("https://github.com/brummer10/${_gitname}/archive/V${pkgver}.tar.gz"
        'LICENSE.txt')
install="${pkgname}.install"
md5sums=('7ab00c779190002a5f191f6d97cfe456'
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
