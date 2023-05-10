# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Michael J. Pento <mjpento at verizon dot net>

pkgname=onioncircuits
pkgver=0.7
pkgrel=1
pkgdesc="GTK application to display Tor circuits and streams"
arch=('any')
url="https://gitlab.tails.boum.org/tails/onioncircuits"
license=('GPL3')
depends=('tor' 'hicolor-icon-theme' 'python>=3.4.2' 'python-gobject>=3.14.0' 'python-stem>=1.2.2' 'gobject-introspection' 'python-pycountry')
makedepends=('git' 'python-setuptools' 'python-distutils-extra')
_commit=6efeff2e7cdbfbab7d73ea5825a64c002fa8e3b9  # tags/0.7^0
source=("git+https://gitlab.tails.boum.org/tails/onioncircuits.git#commit=${_commit}"
        "setuptools_fix.patch")
sha256sums=('SKIP'
            '6f2bab5e0337d0c62eb261b1a907e614f54e096b217e3c1e412d2a8086818f3d')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/setuptools_fix.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
