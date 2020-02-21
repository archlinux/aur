# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-daq
pkgver=0.3.3
pkgrel=1
pkgdesc="Control components for Dash"
arch=('any')
url=https://github.com/plotly/dash-daq
license=('MIT')
depends=(python python-dash python-dash-table python-future yarn python-yaml)
makedepends=(python-setuptools)
source=(https://github.com/plotly/dash-daq/archive/v${pkgver}.tar.gz)
sha256sums=('8ae2c55cff42e839d3a48392c624d102238b87b9ac29be8f74fbe8cb09081ee5')


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
