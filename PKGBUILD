# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_ubuntur="0extras16.04.5"
pkgname="caja-pushbullet"
pkgver="0.5.0"
pkgrel="1"
pkgdesc="An extension for Caja to send files with pushbullet."
arch=('i686' 'x86_64')
url="https://launchpad.net/~atareao/+archive/ubuntu/caja-extensions"
license=('GPL3')
groups=('caja-extensions')
depends=('python2-caja' 'caja-extensions-common' 'pushbullet-commons')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.xz::${url}/+sourcefiles/${pkgname}/${pkgver}-${_ubuntur}/${pkgname}_${pkgver}-${_ubuntur}.tar.xz")
sha256sums=('be26f3d657ac2a21cffc21b3e417fba6108d4c9c7e177177df7d03abc906d7e5')

prepare() {
    cd "${srcdir}/temporal"
    sed -i "s/python/python2/" setup.py
    sed -i "s/caja-python2/caja-python/" setup.py
    sed -i "s/locale-langpack/locales/" setup.py
    sed -i "s/0.3.0-0extras14.04.0/${pkgver}-${_ubuntur}/" ./src/${pkgname}.py
}

build() {
    cd "${srcdir}/temporal"
    python2 setup.py build
}

package() {
    cd "${srcdir}/temporal"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh
