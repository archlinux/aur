# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Serkan Hosca <serkan@hosca.com>

pkgname=devpi-web
_pkgname=devpi_web
pkgver=5.0.1
pkgrel=1
pkgdesc="Web interface plugin for devpi-server"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
depends=(
  'devpi-server'
  'devpi-common'
  'python'
  'python-attrs'
  'python-beautifulsoup4'
  'python-chameleon'
  'python-defusedxml'
  'python-docutils'
  'python-pygments'
  'python-pyramid'
  'python-pyramid-chameleon'
  'python-readme-renderer'
  'python-whoosh<3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-changelog-shortener' 'python-wheel' )
# checkdepends=('python-pytest')
changelog=CHANGELOG
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('461f94dc02985cc608a78a59606dcb2135c86a9e716b189c9c376a19f97e481f')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_pkgname-$pkgver"
#   PYTHONPATH=./ pytest -x -c /dev/null
# }

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
