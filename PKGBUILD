# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-daq
pkgver=0.4.0
pkgrel=1
pkgdesc="Control components for Dash"
arch=('any')
url=https://github.com/plotly/dash-daq
license=('MIT')
depends=(python python-dash python-dash-table python-future yarn python-yaml)
makedepends=(python-setuptools)
source=(https://github.com/plotly/dash-daq/archive/v${pkgver}.tar.gz)
sha256sums=('c1716a5821653bd7b2f625077ba1243e59f9458e6ca29560f6b1a99ef60c0b69')


prepare() {
  cd "$srcdir/dash-daq-$pkgver"
  rm yarn.lock
  rm package-lock.json
  yarn
  python get_version_info.py
  yarn copy-lib
  dash-generate-components ./src/components dash_daq -p package-info.json --r-prefix 'daq'

  #versioneer install 
}

build() {
  cd "$srcdir/dash-daq-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/dash-daq-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
