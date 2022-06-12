# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-backports
_name=${pkgname#python2-}
pkgver=1.1
pkgrel=1
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
  _destdir="$pkgdir/usr/lib/python2.7/site-packages/$_name"
  install -Dm644 "$_name/__init__.py"  "$_destdir/__init__.py"
  install -Dm644 "$_name/__init__.pyc" "$_destdir/__init__.pyc"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
