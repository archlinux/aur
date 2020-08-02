# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-dash-daq
pkgver=0.5.0
pkgrel=1
pkgdesc="Control components for Dash"
arch=('any')
url=https://github.com/plotly/dash-daq
license=('MIT')
depends=(python python-dash python-dash-table python-future yarn python-yaml)
makedepends=(python-setuptools python-dash-table yarn python-brotli)
source=(https://github.com/plotly/dash-daq/archive/v${pkgver}.tar.gz)
sha256sums=('a3c37622843bbd2919565ff6ad08c132fa9155b31f8efce2d627ffa619715d21')


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
