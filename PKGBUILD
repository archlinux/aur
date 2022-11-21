# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python38-itsdangerous
pkgver=2.1.2
pkgrel=2
pkgdesc='Various helpers to pass trusted data to untrusted environments'
arch=('any')
url='https://palletsprojects.com/p/itsdangerous/'
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools' 'python38-build' 'python38-installer' 'python38-wheel')
checkdepends=('python38-pytest' 'python38-freezegun')
source=("https://github.com/mitsuhiko/itsdangerous/archive/${pkgver}/$pkgname-$pkgver.tar.gz")
sha256sums=('a983dd8e49b9374c942b7946f9bfbcf639ed4a22838d353e4cd30d45e20cc943')

build() {
  cd "itsdangerous-$pkgver"
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "itsdangerous-$pkgver"
  PYTHONPATH="build/lib" pytest
}

package() {
  cd "itsdangerous-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
