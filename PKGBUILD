# Maintainer: Justin Dray <justin@dray.be>

pkgname=graphite-influxdb
pkgver=0.4
pkgrel=2
pkgdesc="An influxdb (0.8-rc5 or higher) backend for Graphite-web (source or 0.10.x) or graphite-api."
arch=('any')
depends=('python' 'python-influxdb')
makedepends=('python-setuptools')
optdepends=('graphite-web' 'graphite-api')
url="https://github.com/vimeo/graphite-influxdb"
license=('Apache')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "influxdb08.patch")
sha256sums=('d8ee54b2645b8022d0bf1ce939502bc049827bd71220822c1230ecbd8ed07b32'
            '6e0fcf4f084d8022461f83df35ee79949ebf34b11736d841e4d91f57e1b228e3')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/influxdb08.patch"
}

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
