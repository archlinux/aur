# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Serge Victor <arch@random.re>

pkgbase=python-addict
pkgname=(python-addict python2-addict)
pkgver=2.4.0
pkgrel=3
pkgdesc='Python Dict whos keys can be set both using attribute and item syntax'
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
  pushd "addict-$pkgver"
  python setup.py build
  popd

  pushd "addict-$pkgver-py2"
  python2 setup.py build
}

check() {
  pushd "addict-$pkgver"
  python test_addict.py
  popd

  pushd "addict-$pkgver-py2"
  python2 test_addict.py
}

package_python-addict() {
  depends=('python>=3.6')

  cd "addict-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python2-addict() {
  depends=('python2')

  cd "addict-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
