# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
# Upstream contact: silx at esrf dot fr
pkgname=python-fabio
pkgver=2023.6
pkgrel=1
pkgdesc="I/O library for images produced by 2D X-ray detectors."
arch=('any')
url="http://www.silx.org"
license=('MIT' 'LGPL' 'Apache')
depends=('python-numpy' 'python-pillow' 'python-lxml' 'python-h5py')
optdepends=('python-pyqt5: for the fabio_viewer program')
makedepends=('cython' 'meson-python')
source=("https://github.com/silx-kit/${pkgname#*-}/archive/v${pkgver}.tar.gz")
sha256sums=('5d73320b91ac0bd9f171edaaf8ea728e99bebff4c02324f23a221b55610da2ae')

build() {
    arch-meson "${pkgname#*-}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir="${pkgdir}/"
    install -D "${pkgname#*-}-${pkgver}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
