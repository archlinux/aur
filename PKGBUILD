# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-uuid6
_name=${pkgname#python-}
pkgver=2022.10.25
pkgrel=1
pkgdesc="New time-based UUID formats which are suited for use as a database key"
arch=('any')
url="https://github.com/oittaa/uuid6-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0a56935de9c1ce8dd8559225b845549d94917d9e24ad4b1cc2328eea5be0010c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
