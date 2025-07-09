# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=3.4.3
pkgrel=2
pkgdesc="The Nanjing University login module, which can be used to login to the various campus web sites"
arch=('any')
url='https://github.com/Do1e/NJUlogin'
license=('MIT')
depends=(
  'python>=3.10'
  'python-requests>=2.32.0'
  'python-pillow>=11.0.0'
  'python-numpy>=2.0.0'
  'python-lxml>=5.3.0'
  'python-pycryptodome>=3.21.0'
  'python-onnxruntime>=1.20.0'
  'python-cryptography>=43.0.0'
)
makedepends=(python-poetry)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/6a/d4/d81e0299b5b645492d1e33746794436f04a5f52cdeb7708c8a4cd73e568f/njulogin-3.4.3.tar.gz")
sha256sums=('e0f4cbcfe08be62ad0a88832ac5506fb35418f73f131d6c1c7c592615ca696c1')

build() {
  cd "njulogin-$pkgver"
  poetry config virtualenvs.create false
  poetry build
  poetry config virtualenvs.create true
}

package() {
  cd "njulogin-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
