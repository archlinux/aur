# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jalv-select
pkgname="${_pkgname}-git"
pkgver=0.7.r62.5a010a0
pkgrel=1
pkgdesc="A little GUI to select installed lv2 plug-ins and run them with jalv."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/jalv_select"
license=('custom:Public Domain')
depends=('jalv' 'gtkmm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/brummer10/jalv_select.git"
        'LICENSE.txt')
install="${_pkgname}.install"
md5sums=('SKIP'
         '039bcb549d34b4273393c9ca25848fe6')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(grep "VER =" Makefile | awk '{print $3}')
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install DESTDIR="$pkgdir"

  # readme
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  # license
  install -Dm644 "$srcdir/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
