# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name=pytest-discord

pkgname=python-pytest-discord
pkgver=0.0.7
pkgrel=1
pkgdesc='Pytest plugin to report test results to a Discord channel'
arch=('any')
url='https://github.com/thombashi/pytest-discord'
license=('MIT')
depends=(
  'python-aiohttp>=3.0.1'
  'python-aiohttp<4'
  'python-discord>=1.0.1'
  'python-discord<2'
  'python-pathvalidate>=2.1.0'
  'python-pathvalidate<3'
  'python-pytest>=3.3.2'
  'python-pytest<7'
  'python-pytest-md-report>=0.1.0'
  'python-pytest-md-report<1'
  'python-typepy>=1.1.4'
  'python-typepy<2')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-mock' 'python-dateutil' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz.asc")
sha256sums=('8e8d8c46da4d77112b76e7cdafc1bc73a4bea746812b869cb77489f47456a6cb'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python setup.py pytest
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
