# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="pushbullet-indicator"
pkgver="0.6.0"
pkgrel="4"
pkgdesc="An indicator for working with PushBullet."
arch=('i686' 'x86_64')
url="http://www.atareao.es/tag/pushbullet-indicator/"
license=('GPL3')
depends=('libappindicator-gtk3' 'python' 'shared-mime-info' 'python-beautifulsoup4' 'python-jinja' 'python-pillow' 'python-requests' 'pushbullet-commons')
makedepends=('python2-distutils-extra' 'python2-polib')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/atareao/+files/${pkgname}_${pkgver}-0extras14.04.1.tar.gz")
sha256sums=('b9ff6936c6095d6b81b7331f99965f18e590a04c8086d7d0874782ba2721f3b6')
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
