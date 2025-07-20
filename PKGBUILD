# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sophie Tauchert <sophie@999eagle.moe>
pkgname=python-timeago
_name=${pkgname#python-}
pkgver=1.0.16
pkgrel=3
pkgdesc="Simple library used to format datetime with \`***time ago\` statement."
arch=('any')
url="https://github.com/hustcc/timeago"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b54b88b3d0566cbf01ca11077dad8f7ae07a4318479e3d1b30feebe85f7137f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python test/testcase.py
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
