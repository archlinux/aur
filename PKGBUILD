# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=python-ezchlog
_pkgname=${pkgname#python-}
pkgver=1.1.0
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
sha256sums=('400c8047d6c6ffd83934c3815dfd44a5a49e2d00d9ac049af8b0a89b29f8fbcc')

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
