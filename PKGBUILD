# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>

_pkgname="calendar-indicator"
pkgname="${_pkgname}-bzr"
pkgver="44"
pkgrel="1"
pkgdesc="An indicator for google calendar."
arch=('i686' 'x86_64')
url="http://www.atareao.es/tag/calendar-indicator/"
license=('GPL3')
depends=('python' 'shared-mime-info' 'python-beautifulsoup4' 'python-jinja' 'python-requests')
makedepends=('bzr' 'python2-distutils-extra' 'python2-polib')
provides=("${_pkgname}")
source=("${_pkgname}::bzr+https://code.launchpad.net/~lorenzo-carbonell/calendar-indicator/trunk")
sha256sums=('SKIP')
#install="${pkgname}.install"

pkgver() {
    cd "${_pkgname}"
    bzr revno
}

build() {
    cd "${srcdir}/${_pkgname}"
    sed -i "s|os.path.join(ROOTDIR, 'locale-langpack')|'/usr/share/locale/'|g" ./src/comun.py
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d ${pkgdir}/usr/share/licenses/${_pkgname}
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    mv ./build/locale-langpack ${pkgdir}/usr/share/locale
    
    cd "${pkgdir}"
    rm -rf ./opt/extras.ubuntu.com/calendar-indicator/share/locale-langpack
}

# vim:set ts=4 sw=2 ft=sh et:
