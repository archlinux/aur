# Maintainer:  cucullus <cucullus AT mail . ru>
pkgname=python-obspy
pkgver=1.4.2
pkgrel=2
pkgdesc='A Python framework for processing seismological data'
arch=(x86_64)
url="http://obspy.org/"
license=('LGPL-3.0-only')
depends=("python-scipy" "python-matplotlib" 'python-lxml' 'python-sqlalchemy1.4')
optdepends=('python-cartopy>=0.20: map plotting')
makedepends=('python-distribute')
conflicts=('python-obspy-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/obspy/obspy/archive/$pkgver.tar.gz")
sha256sums=('cbef9081c3cdfa85de8628e584af598a56eb747d220f736eac7fd6e36f6fa1c4')

prepare() {
    cd "$srcdir/obspy-$pkgver"
    patch -p1 < ../../parse_fctns.c.patch
}

build() {
    cd "$srcdir/obspy-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/obspy-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
