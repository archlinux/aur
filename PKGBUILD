# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: xantares
# Contributor: asuka minato

_pkgname=doc2dash
pkgname=python-$_pkgname
pkgver=3.1.0
pkgrel=1
pkgdesc="Create docsets for Dash.app/Zeal-compatible API browsers"
url='https://doc2dash.hynek.me/'
arch=(any)
license=(MIT)
makedepends=(python-hatch-vcs python-hatch-fancy-pypi-readme python-build
             python-installer python-wheel python-hatchling)
depends=(python python-attrs python-beautifulsoup4 python-click python-rich)
source=(
"https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('37f61c8d8f6a955d2466b9c073eb2bff44cc54352bf817afb48a3ac8aef6d594')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

