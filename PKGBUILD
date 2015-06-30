# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="calendar-indicator"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="An indicator for google calendar."
arch=('i686' 'x86_64')
url="http://www.atareao.es/tag/calendar-indicator/"
license=('GPL3')
depends=('python' 'shared-mime-info' 'python-beautifulsoup4' 'python-jinja' 'python-requests')
makedepends=('python2-distutils-extra' 'python2-polib')
conflicts=('calendar-indicator-bzr')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/atareao/+files/${pkgname}_${pkgver}-0extras14.04.3.tar.gz")
sha256sums=('b63678f1dd11a0fbed852bdf49ce2ea8596ec8bc2498e2f0efbfe1116813913d')
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
