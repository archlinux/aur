# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-image-tools"
pkgver="0.0.3"
pkgrel="2"
pkgdesc="An extension for Nautilus to manipulate image files."
arch=('i686' 'x86_64')
url="http://www.atareao.es/apps/nautilus-image-tools-o-como-modificar-imagenes-desde-nautilus/"
license=('GPL3')
depends=('python2-beautifulsoup4' 'python2-exiv2' 'python2-nautilus' 'python2-polib' 'python2-pillow')
makedepends=('python2-distutils-extra')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/nautilus-extensions/+files/${pkgname}_${pkgver}-0extras15.10.6.tar.xz")
sha256sums=('9018a8988597638e51f20b4a4f1c69b0b315593c728e02dd57b04dbf82fb9282')
install="${pkgname}.install"

build() {
    cd "${srcdir}/${pkgname}"
    sed -i "s|/usr/share/locale-langpack|/usr/share/locale|g" ./src/nautilus-image-tools.py
    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d ${pkgdir}/usr/share/locale
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${pkgdir}"
    mv ./usr/share/locale-langpack/* ./usr/share/locale/
    rm -rf ./usr/share/locale-langpack
}

# vim:set ts=4 sw=2 ft=sh et:
