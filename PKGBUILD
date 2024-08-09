# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Serkan Hosca <serkan@hosca.com>

pkgname=devpi-web
_pkgname=devpi_web
pkgver=4.2.2
pkgrel=1
pkgdesc="Web interface plugin for devpi-server"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
depends=(
  'devpi-server>=5.2.0'
  'devpi-common>=3.2.0'
  'python'
  'python-beautifulsoup4>=4.3.2'
  'python-chameleon'
  'python-defusedxml'
  'python-docutils>=0.11'
  'python-pygments>=1.6'
  'python-pyramid>1.10'
  'python-pyramid-chameleon'
  'python-readme-renderer>=23.0'
  'python-whoosh<3')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner' 'python-pytest-cov' 'python-mock' 'python-webtest')
changelog=CHANGELOG
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6f18d9899b283cb64759b04fa15e7b207c19c140ad96af8c359e66cfd5ac57c4')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

# check() {
#   cd "$pkgname-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "$_pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.rst AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
