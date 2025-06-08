# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=python-ezchlog
_pkgname=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('any')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
depends=('python>=3.11')
# depends=('python>=3.9' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://gitlab.com/jrdasm/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('6645731df2b4f9dc524288b25c2f199280b7b8f2923286f8f41f137279f2e745')

build() {
	cd "$_pkgname-v$pkgver"
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
  python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
