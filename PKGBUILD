# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-pushbullet"
pkgver="0.5.0"
pkgrel="2"
pkgdesc="An extension for Nautilus to send files with pushbullet"
arch=('any')
url="https://www.atareao.es/apps/pushbullet-indicator-para-enviar-archivos-entre-ubuntu-y-android/"
license=('GPL3')
depends=('humanity-icon-theme' 'python2' 'pushbullet-commons')
makedepends=('python2-distutils-extra')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/pushbullet/+files/${pkgname}_${pkgver}-0extras16.04.4.tar.xz")
sha256sums=('4adf69c1806a15125df60220e369c449c614808664ea282b2e541d0a0a5dacd9')
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}"
    sed -i "s|/usr/share/locale-langpack|/usr/share/locale|g" ./src/nautilus-pushbullet.py
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
