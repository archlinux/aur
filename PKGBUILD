# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="utext"
pkgver="0.3.9"
pkgrel="2"
pkgdesc="An application to work with markdown files."
arch=('i686' 'x86_64')
url="http://www.atareao.es/tag/utext/"
license=('GPL3')
depends=('gobject-introspection' 'gtkspell3' 'gvfs' 'imagemagick' 'python' 'shared-mime-info' 'python-beautifulsoup4' 'python-jinja' 'python-markdown' 'python-requests' 'wkhtmltopdf')
makedepends=('python2-distutils-extra' 'python2-polib')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/${pkgname}/+files/${pkgname}_${pkgver}-0extras15.04.0.tar.xz")
sha256sums=('6b4a2641c6b4e0477d7b49022dbcd0adf5f7b31893df6122fd6398547800ef0d')
install="${pkgname}.install"

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