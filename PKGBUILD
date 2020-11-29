# Contributor: archus <archus@arch.int.pl>

pkgname=streamtuner2
pkgver=2.2.1
pkgrel=5
pkgdesc="An internet radio browser"
arch=('any')
url="https://sourceforge.net/projects/streamtuner2/"
license=('custom:public domain')
depends=(gtk3 python-dbus python-gobject python-pillow python-pyquery python-pyxdg python-requests youtube-dl)
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver+2020-0$pkgrel.deb")
sha256sums=('dcebec983a11e6c644d42e6e9f4c1b3cb494f869bd1ef84deb0b3b42220bb2b3')


prepare() {
	ar -x ${pkgname}-${pkgver}+2020-0${pkgrel}.deb
	mkdir ${pkgname}-${pkgver}_${pkgrel}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}_${pkgrel}"
}

package() {

	cd "${pkgname}-${pkgver}_${pkgrel}"

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
