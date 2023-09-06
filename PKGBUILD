# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Michael J. Pento <mjpento at verizon dot net>

pkgname=onioncircuits
pkgver=0.8
pkgrel=1
pkgdesc="GTK application to display Tor circuits and streams"
arch=('any')
url="https://gitlab.tails.boum.org/tails/onioncircuits"
license=('GPL3')
depends=('tor' 'hicolor-icon-theme' 'python>=3.4.2' 'python-gobject>=3.14.0' 'python-stem>=1.2.2' 'gobject-introspection' 'python-pycountry')
makedepends=('git' 'python-setuptools' 'python-distutils-extra')
_commit=ca2cfc399ca72446258c85300ad0ff975c5e213c  # tags/0.8^0
source=("git+https://gitlab.tails.boum.org/tails/onioncircuits.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
