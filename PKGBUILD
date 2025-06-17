# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=3.4.0
pkgrel=1
pkgdesc="The Nanjing University login module, which can be used to login to the various campus web sites"
arch=('any')
url='https://github.com/Do1e/NJUlogin'
license=('MIT')
depends=(
  'python>=3.10'
  'python-requests>=2.32.3'
  'python-pillow>=11.0.0'
  'python-numpy>=2.1.3'
  'python-lxml>=5.3.0'
  'python-pycryptodome>=3.21.0'
  'python-user-agents>=2.2.0'
  'python-onnxruntime>=1.20.0'
  'python-cryptography>=43.0.3'
)
makedepends=(python-poetry)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/f3/53/3e9728260af6fa6af9e5f58d9e7de21a1e605a7bd0dc189df1a7abf2ec8e/njulogin-3.4.0.tar.gz")
sha256sums=('11a3aecb2359efe80e9ffa5e28efac7836b16fe9a142a4e525a4b05e9355b199')

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
