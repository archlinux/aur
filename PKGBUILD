# Maintainer: Rich Li <rich@dranek.com>
pkgname=python-cmocean
pkgver=2.0
pkgrel=1
pkgdesc="Beautiful colormaps for oceanography"
url="https://matplotlib.org/cmocean/"
depends=('python-matplotlib')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matplotlib/cmocean/archive/${pkgver}.tar.gz")
md5sums=('37203d30c9a791974bfb4be06c0356ed')
sha1sums=('ce9849b7423effc099ad646f76d8bc788a6eb411')
sha256sums=('bab61cbcd6a17d55f3351e210299ed7ad2117b47952d22fdddfbdd055c2ca75d')

build() {
    cd "$srcdir/cmocean-${pkgver}"
    python setup.py build
}

check() {
    cd "$srcdir/cmocean-${pkgver}"
    PYTHONPATH="./build/lib" pytest -v
}

package() {
    cd "$srcdir/cmocean-${pkgver}"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
