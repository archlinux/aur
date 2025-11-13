# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=python-ezchlog
_pkgname=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('any')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
depends=('python>=3.11')
# depends=('python>=3.10' 'python-tomli')
makedepends=('uv' 'python-installer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://gitlab.com/jrdasm/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('dcc7b791740444fd282b8cc098ac0a7120702ba5eeb1fb4c9b08be2aeef38746')

build() {
  cd "$_pkgname-v$pkgver"
  # strip installation info in README
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
  uv build --wheel
}

package() {
  cd "$_pkgname-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
