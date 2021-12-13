# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Serge Victor <arch@random.re>

pkgbase=python-addict
pkgname=(python-addict python2-addict)
pkgver=2.4.0
pkgrel=4
pkgdesc='Augments dictionaries with attribute syntax'
arch=('any')
url='https://github.com/mewwts/addict'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/addict/addict-$pkgver.tar.gz")
sha256sums=('b3b2210e0e067a281f5646c8c5db92e99b7231ea8b0eb5f74dbdf9e259d4e494')

prepare() {
  cp -a "addict-$pkgver" "addict-$pkgver-py2"
}

build() {
  ( cd "addict-$pkgver"
    python setup.py build )
  ( cd "addict-$pkgver-py2"
    python2 setup.py build )
}

check() {
  ( cd "addict-$pkgver"
    python test_addict.py )
  ( cd "addict-$pkgver-py2"
    python2 test_addict.py )
}

package_python-addict() {
  depends=('python>=3.6')

  export PYTHONHASHSEED=0
  cd "addict-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python2-addict() {
  depends=('python2')

  export PYTHONHASHSEED=0
  cd "addict-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
