# Maintainer: Jeff Walters <sy.achmed at gmail dot com>
pkgname=('python-gkraken')
_module='gkraken'
pkgver='0.12.1'
pkgrel=1
pkgdesc="GUI to control cooling and lighting of NZXT Kraken X (X42, X52, X62 or X72) pumps"
url="https://gitlab.com/leinardi/gkraken/"
depends=('python' 'python-liquidctl' 'python-injector' 'python-cairo' 'python-matplotlib' 'python-peewee' 'python-gobject' 'python-xdg' 'python-requests' 'python-rx' 'libappindicator-gtk3')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
  "https://files.pythonhosted.org/packages/b7/a6/823ddcb879e98ea7d5b2c296b993d73b10f0a2c0d2427684a31edf9b47ba/gkraken-${pkgver}.tar.gz"
  deps.patch
)
md5sums=('4566e683f076522fc83320f2f558346f'
	 '92eb4d150df30288d9b2bee2aa41279f')

prepare() {
    cd $_module-$pkgver
    patch -Np1 < "${srcdir}/deps.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
