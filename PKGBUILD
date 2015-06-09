# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="utext"
pkgver="0.3.4"
pkgrel="1"
pkgdesc="An application to work with markdown files."
arch=('i686' 'x86_64')
url="http://www.atareao.es/tag/utext/"
license=('GPL3')
depends=('python' 'shared-mime-info' 'python-beautifulsoup4' 'python-jinja' 'python-markdown' 'python-requests' 'wkhtmltopdf')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/${pkgname}/+files/${pkgname}_${pkgver}-0extras15.04.0.tar.xz")
sha256sums=('720df6fd480591bcb64f5bcf71b8c96cfbe0f34bb867d5be908fde8a109ed629')
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
