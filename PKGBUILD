# Maintainer: Mehdi <mah.fat@gmail.com>

pkgname=studio-brightness-linux
pkgver=1.0.3
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
sha256sums=('aa6da0f23bf2b339ecd7fcf7f9be532ad38e70e960d0d68049a2bd5759c1199f')

check() {
	make -C "${pkgname}-${pkgver}" check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
