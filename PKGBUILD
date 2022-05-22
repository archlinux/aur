# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: archus <archus@arch.int.pl>

pkgname=streamtuner2
pkgver=2.2.2
pkgrel=1
pkgdesc="An internet radio browser"
arch=('any')
url="https://sourceforge.net/projects/streamtuner2/"
license=('custom:public domain')
depends=(gtk3 python-dbus python-gobject python-pillow python-pyquery python-pyxdg python-requests youtube-dl)
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.deb")
sha256sums=('0ae036770c23f8e968711904a701e6a5b5033b56d161c3ea35bb3d5c0098f434')


prepare() {
	ar -x ${pkgname}-${pkgver}.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {

	cd "${pkgname}-${pkgver}"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/applications/"
	install -dm755 "$pkgdir/usr/share/doc/"
	install -dm755 "$pkgdir/usr/share/man/"
	install -dm755 "$pkgdir/usr/share/pixmaps/"

	# Install
	install -dm755 "$pkgdir/usr/share/streamtuner2/"
	install -dm755 "$pkgdir/usr/share/doc/streamtuner2/"
	install -Dm755 "./usr/bin/streamtuner2" "$pkgdir/usr/bin/streamtuner2"
	install -Dm644 "./usr/share/pixmaps/streamtuner2.png" "$pkgdir/usr/share/pixmaps/streamtuner2.png"
	install -Dm644 "./usr/share/applications/streamtuner2.desktop" "$pkgdir/usr/share/applications/streamtuner2.desktop"
	find ./usr/share/doc/streamtuner2 -type f -exec install -Dm644 {} $pkgdir/{} \;
	install -Dm644 "./usr/share/man/man1/streamtuner2.1" "$pkgdir/usr/share/man/man1/streamtuner2.1"
	find ./usr/share/streamtuner2 -type f -exec install -Dm644 {} $pkgdir/{} \;

}
