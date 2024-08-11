# Python package author: Cobertos <me@cobertos.com>
python_pkgname=unitypackage_extractor
pkgname=python-${python_pkgname}
pkgver=1.1.0
pkgrel=1
pkgdesc="Extractor for .unitypackage files"
arch=(any)
url="https://github.com/Cobertos/unitypackage_extractor/"
license=(MIT)
depends=("python-tarsafe")
makedepends=("python" "python-pip")
source=(git+https://github.com/Cobertos/unitypackage_extractor.git#tag=v${pkgver}
        entry_points.patch)
sha256sums=('a54ef792d26eb2afe3b56d99cafeca43eeae5057d63c0ad2f47df477b986b824'
            'ad5d663e5d0f56965a22e4bd094ad7f205e2718617f2d2c0b12558d1c651ca8e')
prepare() {
  cd "$python_pkgname"
  patch -p1 -i "$srcdir/entry_points.patch"
}
build() {
  cd "$python_pkgname"
  python setup.py build
}
package() {
  cd "$python_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
