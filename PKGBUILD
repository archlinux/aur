# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: MarkZZ <mark dot weiman at markzz dot com>
# Contributer: t3ddy <t3ddy1988 "at" gmail {dot} com>
# Contributor: kriation
#
pkgname="fluxgui"
pkgver=1.1.10
pkgrel=1
pkgdesc="Better lighting for Linux. Open source GUI for xflux"
url="https://justgetflux.com/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('hicolor-icon-theme' 'libindicator-gtk2' 'libappindicator-gtk2'\
         'python2-libappindicator' 'python2-pexpect' 'python2-xdg'\
         'python2-gconf'
)
makedepends=('python2-pip')
conflicts=('xflux' 'xflux-gui-git')
provides=("${pkgname}")
source=("https://github.com/xflux-gui/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('04f4205f996e4e8019f48403c4a99804bdb681bd5d12149f8e46be2c77000868')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 ./download-xflux.py
    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --prefix=/usr --root="${pkgdir}"/ --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
