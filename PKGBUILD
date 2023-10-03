# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkwidgets')
pkgver=0.13.0
pkgrel=1
pkgdesc="Collection of widgets for Tkinter's ttk extensions"
_name=ttkwidgets
arch=('any')
url="https://github.com/RedFantom/ttkwidgets"
license=('GPL3')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('085c4e3c2e915e2bdae14731ba0d11f017aa103e60aaceb9e1700311074e609e569ae77d50e76eb598a96aab354a1a62062f8417201f262f34e51d344918f223')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=('tk' 'python-pillow')

prepare() {
  cd "$_name-$pkgver"
  sed -i "s|ANTIALIAS|LANCZOS|g" ttkwidgets/itemscanvas.py
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}



