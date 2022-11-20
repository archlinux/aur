# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-scooby
pkgver=0.7.0
pkgrel=1
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("https://github.com/banesullivan/scooby/archive/v${pkgver}.tar.gz")
sha256sums=('e7da53fa2f0cb29390f4b35db1d197092706392cf9a4548c3d263d81fc83f142')

# uses git version, release does not work
prepare() {
    cd "$srcdir"/scooby-${pkgver}
    head -n 35 setup.py >tmp
    sed -i "/^import setuptools.*/a __version__='$pkgver'" tmp
    echo "   version=__version__)" >> tmp
    echo "version='$pkgver'" > scooby/version.py
    mv tmp setup.py
}

build() {
  cd "$srcdir"/scooby-${pkgver}
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir"/scooby-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
