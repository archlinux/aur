# Maintainer: None <UNKNOWN>
# Contributor: None
# Python package author: Marco Edward Gorelli <UNKNOWN>

pkgname=python-auto-walrus
_name=${pkgname#python-}
_download=${_name//-/_}
pkgver=0.2.2
pkgrel=1
pkgdesc='A tool and pre-commit hook to automatically apply the awesome walrus operator.'
arch=(any)
url="https://github.com/MarcoGorelli/auto-walrus"
license=(MIT)
depends=()
makedepends=(python-build python-installer python-wheel python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_download-$pkgver.tar.gz)
sha256sums=('c7125868e6fb428089b9b7a68ce46969058f3fd732c07203e745a3fc75bb8b67')

build() {
  cd $_download-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_download-$pkgver"
  pytest
}

package(){
  cd $_download-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
