# Maintainer: Jon Kristian <hello@jonkristian.no>
pkgname=pulsar-x3-python
pkgver=0.1.1
pkgrel=1
pkgdesc="Control Pulsar X3 gaming mouse on Linux - GUI and CLI"
arch=('any')
url="https://github.com/jonkristian/pulsar-x3-python"
license=('MIT')
depends=(
	'python'
	'python-pyusb'
	'python-gobject'
	'libadwaita'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ba7259b0d7ae887b524615d83e4f153c51bf84fa7202728a267d0cd2c71091a')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# Install CLI tool
	install -Dm755 pulsar_x3.py "$pkgdir/usr/bin/pulsar-x3"

	# Install GUI
	install -Dm755 pulsar_x3_gui.py "$pkgdir/usr/bin/pulsar-x3-gui"

	# Install udev rules
	install -Dm644 99-pulsar-mouse.rules "$pkgdir/usr/lib/udev/rules.d/99-pulsar-mouse.rules"

	# Install desktop file
	install -Dm644 pulsar-x3-control.desktop "$pkgdir/usr/share/applications/pulsar-x3-control.desktop"

	# Install license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
