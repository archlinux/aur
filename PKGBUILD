# Maintainer: Flaviu Tamas <me@flaviutamas.com>

pkgbase='tdmgr'
pkgname=('tdmgr')
_module='tdmgr'
pkgver='0.2.11'
pkgrel=1
pkgdesc="Tasmota Device Manager is able to find, monitor and do magic things. The easy way. Like a Superhero."
url="https://github.com/jziolkowski/tdm"
depends=('python' 'python-paho-mqtt' 'python-pyqt5')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8023075fa19a8d03d9812fbdadb0fae87fac73a3a963e53e10aa26dd4e1ba595')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    touch CHANGELOG.md # work around https://github.com/jziolkowski/tdm/pull/160
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mv "${pkgdir}/usr/bin/tdmgr.py" "${pkgdir}/usr/bin/tdmgr"
}
