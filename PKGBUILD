# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter
pkgver=3.2.0
pkgrel=2
pkgdesc="The simplest + fastest video cut & merge tool"
arch=('any')
license=('GPL3')
url="http://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter-git')
md5sums=('eed9c06b6600c1e830bf774cbce56a3b')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/pypi/arch/" "${pkgname}/__init__.py"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
