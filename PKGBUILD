# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname='persepolis'
pkgver=2.4.2
pkgrel=1
pkgdesc="A graphical front-end for aria2 download manager with lots of features."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'libnotify' 'python' 'python-pyqt5' 'python-requests' 'python-setproctitle' 'qt5-svg')
optdepends=('firefox-flashgot: for integrating with firefox.')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/persepolisdm/persepolis/archive/${pkgver}.tar.gz")
sha256sums=('d4e9aa12946d70bb246dfef0813ea12feb82424ca873cc81a37e6ee53010773f')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    gzip -k -9 ./man/persepolis.1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/share/persepolis	
	cp -a ./files/*   ${pkgdir}/usr/share/persepolis
	install -Dm755 ./persepolis ${pkgdir}/usr/bin/persepolis
	install -Dm644 ./persepolis.desktop ${pkgdir}/usr/share/applications/persepolis.desktop
	install -Dm644 ./man/persepolis.1.gz ${pkgdir}/usr/share/man/man1/persepolis.1.gz
	install -Dm644 ./files/icon.svg ${pkgdir}/usr/share/pixmaps/persepolis.svg
	install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/persepolis/LICENSE
}
