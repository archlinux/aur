# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-textstat
_name=${pkgname#python-}
pkgver=0.7.3
pkgrel=1
pkgdesc="Python package to calculate readability statistics of a text object - paragraphs, sentences, articles."
arch=('any')
url="https://github.com/textstat/textstat"
license=('MIT')
depends=('python-pyphen')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('60b63cf8949f45bbb3b4205e4411bbc1cd66df4c08aef12545811c7e6e24f011')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
