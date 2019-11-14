# Maintainer: oguzkagan <me@oguzkaganeren.com.tr>
#
# Contributor: Gabriel B. Casella <gbc921@gmail.com>
#
pkgname="fluxgui"
pkgver=1.2.0
pkgrel=1
pkgdesc="Better lighting for Linux. Open source GUI for xflux"
url="https://justgetflux.com/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('hicolor-icon-theme' 'libindicator-gtk2' 'libappindicator-gtk2'\
         'python2-libappindicator' 'python2-pexpect' 'python2-xdg'\
         'python2-gconf' 'libappindicator-gtk3'
)
makedepends=('python2-pip')
conflicts=('xflux' 'xflux-gui-git')
provides=("${pkgname}")
source=("https://github.com/xflux-gui/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3c230fa7fd5515996849ee775675aad86cb95fdbb824c18425fbdceb076bce63')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python ./download-xflux.py
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"/ --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
