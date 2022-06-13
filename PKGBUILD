# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-backports
_name=${pkgname#python2-}
pkgver=1.1
pkgrel=2
pkgdesc='Namespace for backported Python features'
arch=('any')
url='https://github.com/brandon-rhodes/backports'
license=('MIT')
depends=('python2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64fbda275c95e04f09ca5c11e33527866b1b1c8f16bb0eea2f504f2d3b60195c')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  mkdir -p "$_name"
  sed 's-\s*--;/extend_path/!d' README.rst > "$_name/__init__.py"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m compileall "$_name"
}

package() {
  cd "$srcdir/$_name-$pkgver"
  find "$_name"/__init__* -exec \
    install -Dm644 '{}' "$pkgdir/usr/lib/python2.7/site-packages"/'{}' \;
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
