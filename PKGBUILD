# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=3.5.1
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/3b/8c/5f600b660e90b111168cbe33829a7dd6e67f2508bb9bd1fc95b85541b94e/njulogin-3.5.1.tar.gz")
sha256sums=('35b093816d082f3e1a101db729ee4aedb8a3ffa39dcd31dc7551a721e1ad9d62')

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
