# Maintainer: None <UNKNOWN>
# Contributor: None
# Python package author: Marco Edward Gorelli <UNKNOWN>

pkgname=python-auto-walrus
_name=${pkgname#python-}
_download=${_name//-/_}
pkgver=0.3.4
pkgrel=3
pkgdesc='A tool and pre-commit hook to automatically apply the awesome walrus operator.'
arch=(any)
url="https://github.com/MarcoGorelli/auto-walrus"
license=(MIT)
depends=()
makedepends=(python-build python-installer python-wheel python-covdefaults)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_download-$pkgver.tar.gz)
sha256sums=('66a802fc6aae3b6bacbc2fe59f374e7a5616cc471b0f9bf9427e9fa20fae2284')

build() {
  cd $_download-$pkgver
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$srcdir/$_download-$pkgver"
#  pytest
#}

package(){
  cd $_download-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
