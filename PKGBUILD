# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-uuid6
_name=${pkgname#python-}
pkgver=2023.5.2
pkgrel=1
pkgdesc="New time-based UUID formats which are suited for use as a database key"
arch=('any')
url="https://github.com/oittaa/uuid6-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('03cb97f25ca7b0ac4bea2b3a205f66bfe7f58d3b179bb0f76e1d7946446b6133')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
