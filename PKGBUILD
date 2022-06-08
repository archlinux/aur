# Maintainer: PhotonX <photon89 at googlemail dot com>

pkgname=pylinuxwheel
pkgver=0.6.1
pkgrel=1
pkgdesc="A graphical program developed in gtk3 to configure your Logitech Steering Wheel in Linux"
url="https://odintdh.itch.io/pylinuxwheel"
arch=(x86_64)
license=(GPL3)
depends=(python-cairo python-gobject python-pyudev python-evdev gtk3)
source=("https://gitlab.com/OdinTdh/pyLinuxWheel/-/archive/$pkgver/pyLinuxWheel-$pkgver.tar.gz")
sha256sums=('736b6897b2e21694ebf5ca07e0ebf9fcc9c96b6bfa6f26cfc5699fae9f5c3559')

prepare() {
	cd pyLinuxWheel-$pkgver
	sed -i 's/Utility/Game/' data/desktop/io.itch.pyLinuxWheel.desktop
	sed -i 's/Exec=pyLinuxWheel/Exec=pylinuxwheel/' data/desktop/io.itch.pyLinuxWheel.desktop
}

package() {
	cd pyLinuxWheel-$pkgver
	install -d -m755 "$pkgdir/usr/bin"
	install -m 755 "pyLinuxWheel.py" "$pkgdir/usr/bin/pylinuxwheel"
	install -d -m755 "$pkgdir/usr/share/applications"
	install -m 755 "data/desktop/io.itch.pyLinuxWheel.desktop" "$pkgdir/usr/share/applications/pyLinuxWheel.desktop"
	install -d -m755 "$pkgdir/usr/share/pixmaps"
	install -m 755 "data/img/icon-64-pyLinuxWheel.png" "$pkgdir/usr/share/pixmaps/pyLinuxWheel.png"
	install -d -m755 "$pkgdir/usr/share/pyLinuxWheel/"
	cp -r "data" "$pkgdir/usr/share/pyLinuxWheel/"
	install -d -m755 "$pkgdir/usr/share/"
	cp -r "locale" "$pkgdir/usr/share/"
}
