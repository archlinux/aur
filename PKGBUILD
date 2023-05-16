# Maintainer: Flaviu Tamas <me@flaviutamas.com>

pkgbase='tdmgr'
pkgname=('tdmgr')
_module='tdm'
pkgver='0.2.13'
pkgrel=1
pkgdesc="Tasmota Device Manager is able to find, monitor and do magic things. The easy way. Like a Superhero."
url="https://github.com/jziolkowski/tdm"
depends=('python' 'python-paho-mqtt' 'python-pyqt5')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("$url/archive/refs/tags/v$pkgver.zip")
sha256sums=('67c3916943cd83cb3ef41c8eca1a75d47e3c6f768c566c39c2baa31447d1afab')

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
