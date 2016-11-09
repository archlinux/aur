# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="utext"
pkgver="0.5.0"
pkgrel="2"
_ubuntur="0extras16.04.1"
pkgdesc="An application to work with markdown files."
arch=('i686' 'x86_64')
url="http://www.atareao.es/tag/utext/"
license=('GPL3')
depends=('gobject-introspection' 'gtkspell3' 'gvfs' 'imagemagick' 'python' 'shared-mime-info' 'python-beautifulsoup4' 'python-jinja' 'python-lxml' 'python-markdown' 'python-requests' 'wkhtmltopdf')
makedepends=('python2-distutils-extra' 'python2-polib')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/${pkgname}/+files/${pkgname}_${pkgver}-${_ubuntur}.tar.xz")
sha256sums=('43f779552b29aab04edcf79def2ad9b2e6b2bd45daee1cd57c6e5a97321697f2')

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
    rm -rf ./opt/extras.ubuntu.com/utext/share/locale-langpack
}

# vim:set ts=4 sw=2 ft=sh et:
