# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=3.5.0
pkgrel=1
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/b1/09/846ea3f17ebd363cf2a15f6bdfcdb3aef3cc504c4128c10e9bf7aac1bf96/njulogin-3.5.0.tar.gz")
sha256sums=('8644acc436c360530f53e203fc7da017ab1e80c1f6df40cab61cc8c7aa650b67')

build() {
  cd "njulogin-$pkgver"
  original_venv_setting=$(poetry config virtualenvs.create --local)
  poetry config virtualenvs.create false
  poetry build
  poetry config virtualenvs.create "$original_venv_setting"
}

package() {
  cd "njulogin-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
