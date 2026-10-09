# Maintainer: Mehdi <mah.fat@gmail.com>

pkgname=studio-brightness-linux
pkgver=1.0.2
pkgrel=1
pkgdesc='Brightness control for Apple Cinema, Thunderbolt, Studio and Pro XDR displays'
url='https://github.com/mfat/studio-brightness-linux'
license=('MIT')
arch=('any')
# gtk4 + libadwaita for the window; gtk3 + python-cairo for the on-screen indicator,
# an X11 popup with a cairo input shape.
depends=('python' 'python-gobject' 'python-cairo' 'glib2' 'gtk4' 'libadwaita' 'gtk3' 'systemd')
checkdepends=('desktop-file-utils' 'appstream')
optdepends=('libnotify: desktop notifications with --notify')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ce8422077ae0c37fb16b05972cdf101f71b6e29371f075e4e01647f2555331f')

check() {
	make -C "${pkgname}-${pkgver}" check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
