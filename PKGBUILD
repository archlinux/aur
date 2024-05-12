# Maintainer: None <UNKNOWN>
# Contributor: None
# Python package author:  Anthony Sottile <UNKNOWN>

pkgname=python-covdefaults
_name=${pkgname#python-}
_download=${_name//-/_}
pkgver=2.3.0
pkgrel=1
pkgdesc='A coverage plugin to provide sensible default settings.'
arch=(any)
url="https://github.com/asottile/covdefaults"
license=(MIT)
depends=('python-pytest-cov')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_download-$pkgver.tar.gz)
sha256sums=('4e99f679f12d792bc62e5510fa3eb59546ed47bd569e36e4fddc4081c9c3ebf7')

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
