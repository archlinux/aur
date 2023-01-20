# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-moddb
_name=${pkgname#python-}
pkgver=0.8.1
pkgrel=1
pkgdesc="A Python scraper to access ModDB mods, games and more as objects"
arch=('any')
url="https://github.com/ClementJ18/moddb"
license=('MIT')
depends=('python-beautifulsoup4' 'python-pyrate-limiter' 'python-requests' 'python-toolz')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cf103b4cb1d43e4fcf2cd9e64ca030767e946fdce2ddb091ab8808ea04781ab8')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
