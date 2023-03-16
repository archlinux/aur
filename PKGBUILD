# Maintainer: fearlessdots <filipebertelli@tutanota.com>
# About this software's licensing: <https://github.com/leezer3/OpenBVE/issues/589>

pkgname=openbve-bin
pkgver=1.9.0.1
pkgrel=1
pkgdesc="Realistic 3D train/railway simulator"
arch=('x86_64')
url="https://github.com/leezer3/OpenBVE"
license=('custom:public domain')
depends=('mono')
provides=('openbve')
conflicts=('openbve')
source=("https://github.com/leezer3/OpenBVE/releases/download/${pkgver}/OpenBVE-${pkgver}.deb")
sha256sums=('11c4bf223d8cfa37f8fc9a6ece01d2ce6957a303da07acc3faeec2255ecea1e1')

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

	# Change game launcher
	cat "$pkgdir/usr/games/openbve" | sed 's#/usr/bin/cli#/usr/bin/mono#' | tee "$pkgdir/usr/games/openbve"

	# Link executable to /usr/bin
	install -d "$pkgdir/usr/bin/"
	ln -sf /usr/games/openbve "$pkgdir/usr/bin/openbve"
}
