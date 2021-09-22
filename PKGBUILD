# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-flexx
pkgver=0.8.3
pkgrel=1
pkgdesc='Write desktop and web apps in pure Python'
arch=('any')
url='https://github.com/flexxui/flexx'
license=('BSD')
depends=(
  'python-dialite>=0.5.2'
  'python-pscript>=0.7.3'
  'python-tornado'
  'python-webruntime>=0.5.6')
makedepends=('python-setuptools' 'python-sphinx')
# checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('213bcd79a3758a755c3f5ef92e4b576ac83b2fd879d81c772435b777d0f53ef3')

build() {
  cd "flexx-$pkgver"
  python setup.py build
  cd docs
  make man
}

# check() {
#   cd "flexx-$pkgver/"
#   python setup.py pytest
# }

package() {
  cd "flexx-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/man/flexx.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
