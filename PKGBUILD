# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="calendar-indicator"
pkgver="0.3.4"
pkgrel="3"
pkgdesc="An indicator for google calendar."
arch=('i686' 'x86_64')
url="http://www.atareao.es/apps/calendar-indicator-o-google-calendar-en-ubuntu/"
license=('GPL3')
depends=('libappindicator-gtk3' 'python' 'shared-mime-info' 'python-beautifulsoup4' 'python-dateutil' 'python-jinja' 'python-requests')
makedepends=('python2-distutils-extra' 'python2-polib')
conflicts=('calendar-indicator-bzr')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/atareao/+files/${pkgname}_${pkgver}-0extras15.10.0.tar.xz")
sha256sums=('4fbfbc8826eb823d0bc8dc025c3505740be24787083be53a3007f7fbdd5eb227')
#install="${pkgname}.install"

build() {
    cd "${srcdir}/${pkgname}"
    sed -i "s|os.path.join(ROOTDIR, 'locale-langpack')|'/usr/share/locale/'|g" ./src/comun.py
    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv ./build/locale-langpack ${pkgdir}/usr/share/locale
    
    cd "${pkgdir}"
    rm -rf ./opt/extras.ubuntu.com/${pkgname}/share/locale-langpack
}

# vim:set ts=4 sw=2 ft=sh et:
