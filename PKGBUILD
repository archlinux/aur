# Maintainer: VCalV

_name=sentencex
pkgname="python-$_name"
pkgver=0.6.1
pkgrel=3
pkgdesc="Sentence segmenter that supports ~300 languages"
arch=('any')
url='https://github.com/wikimedia/sentencex'
license=('MIT')
depends=('python>=3.8' 'python-gradio>=4.0' 'python-gradio<6.0')
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('9f740c39b8e3f63b628e6fd0ef32a735297f88884eb8fcfc9de454ed853cde7c853fdb6f4c1897610bd45d181fc9e65a461d22da3ee617481d11c342388eb69b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_name-$pkgver"
  pytest -o addopts=""
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

