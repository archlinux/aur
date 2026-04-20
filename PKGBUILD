# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-pyciede2000
_name=${pkgname#python-}
pkgver=0.0.21
pkgrel=1
pkgdesc="Python library to calculate CIEDE2000 color difference."
arch=('any')
url="https://github.com/shameempk/pyciede2000"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('18bd261368df2540ad3b6542ef5204dd57c6840b6e33b7f0b63868353072879e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
