# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="pushbullet-indicator"
pkgver="0.6.3"
pkgrel="1"
pkgdesc="An indicator for working with PushBullet."
arch=('i686' 'x86_64')
url="https://www.atareao.es/apps/pushbullet-indicator-para-enviar-archivos-entre-ubuntu-y-android/"
license=('GPL3')
depends=('libappindicator-gtk3' 'python' 'shared-mime-info' 'python-beautifulsoup4' 'python-jinja' 'python-pillow' 'python-requests' 'pushbullet-commons')
makedepends=('python2-distutils-extra' 'python2-polib')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/pushbullet/+files/${pkgname}_${pkgver}-0extras16.04.0.tar.xz")
sha256sums=('5bacfbe0ea6bfeb8b5946aec8d71b5bfe910a1971f6323bbfbd3531ed42c6776')
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
