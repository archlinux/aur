# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=python-ezchlog
_pkgname=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('any')
url="https://gitlab.com/snake_coders/ezchlog"
license=('MIT')
depends=('python>=3.11')
# depends=('python>=3.10' 'python-tomli')
makedepends=('uv' 'python-installer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://gitlab.com/snake_coders/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('c6ad8cabc74f12f6a808018f329f0dd4491f8e76b1009bbca310c4d9b5407e98')

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
