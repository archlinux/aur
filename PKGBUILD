# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="rename-me"
pkgver="0.0.6.4"
pkgrel="2"
pkgdesc="An extension to rename files with Nautilus"
arch=('any')
url="http://www.atareao.es/tag/rename-me/"
license=('GPL-3.0+')
depends=('python2')
makedepends=('python2-distutils-extra' 'python2-polib')
source=("https://launchpad.net/~atareao/+archive/ubuntu/nautilus-extensions/+files/${pkgname}_${pkgver}-1ubuntu1.tar.xz")
sha256sums=('b547bb22768be8f3ee800a7d6961b4f9e80d35d735d409df2b4bc23d942eee9f')

build() {
	cd "${srcdir}/${pkgname}"
    sed -i "s|locale-langpack|locale|g" ./src/rename-me.py
	python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -d ${pkgdir}/usr/share/locale

    cd "${pkgdir}"
    mv ./usr/share/locale-langpack/* ./usr/share/locale/
    rm -rf ./usr/share/locale-langpack
}

# vim:set ts=4 sw=2 ft=sh et: