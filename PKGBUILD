# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_name=fnvhash
pkgname=python-$_name
pkgver=0.1.0
pkgrel=2
pkgdesc='Pure Python FNV hash implementation'
url='https://github.com/znerol/py-fnvhash'
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/znerol/py-fnvhash/master/LICENSE"
)
sha512sums=('073bca46261af6212b1d92cacbb592f7165f6ea20f0bf6e27c4ce5c4e1f5e855fc16970b0c718726dc2ef9af70442bb196de56bfd90e3c1da2f540625d8a0e4d'
            '6d030cc6f68f78cd0b786c75d1dc99a5dd89af67ac3088605f91ef7433ef9097613b0d5dd92ea16e6dc6a372e7ce7aed0b44551b09981426f38e0fee9d4d52e1')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
