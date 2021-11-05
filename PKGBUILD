# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-panwid
pkgver=0.3.4
pkgrel=1
pkgdesc="A collection of widgets for urwid"
url="https://github.com/tonycpsu/panwid"
arch=('any')
license=('LGPL2.1')
depends=(
  'python-urwid_utils' 'python-six' 'python-raccoon'
  'python-blist' 'python-orderedattrdict'
)
makedepends=('python-setuptools')
source=(
  "panwid-$pkgver.tar.gz::https://github.com/tonycpsu/panwid/archive/v$pkgver.tar.gz"
  "exclude_tests.patch"
)
sha256sums=(
  '4c1718504799d98437cf5cfa4f596ae645c842e87ab67d37b4a4e2dfc1dd523c'
  'fa5bcff2ffbf73a214c52be6d2e31f1e6528a69a54478fdadded4038ecac7e22'
)

prepare() {
    cd "panwid-$pkgver"
    patch -p0 -i "$srcdir/exclude_tests.patch"
}

build() {
    cd "panwid-$pkgver"
    python setup.py build
}

check() {
    cd "panwid-$pkgver"
    python setup.py test
}

package() {
    cd "panwid-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --skip-build --optimize=1
    mv "$pkgdir/usr/share/doc/panwid" "$pkgdir/usr/share/doc/python-panwid"
    rm "$pkgdir/usr/share/doc/python-panwid/LICENSE"
}
