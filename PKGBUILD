# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: mar77i <mar77i at mar77i dot ch>

pkgname="python-sphinx-paramlinks"
_pkg="${pkgname#python-}"
pkgver=0.6.0
pkgrel=1
pkgdesc="Allows :param: directives within Python documentation to be linkable."
arch=('any')
url="https://github.com/sqlalchemyorg/sphinx-paramlinks"
license=('MIT')
depends=('python' 'python-sphinx')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(272d457093185ff20699455375db01db7013f617d90035a5b0ed2dd2b86899a6)

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dvm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
