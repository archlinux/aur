# Maintainer: fearlessdots <filipebertelli@tutanota.com>
# About this software's licensing: <https://github.com/leezer3/OpenBVE/issues/589>

pkgname=openbve-bin
pkgver=1.8.3.2
pkgrel=1
pkgdesc="Realistic 3D train/railway simulator"
arch=('x86_64')
url="https://github.com/leezer3/OpenBVE"
license=()
depends=('mono')
source=("https://github.com/leezer3/OpenBVE/releases/download/${pkgver}/OpenBVE-${pkgver}.deb")
sha256sums=("a3b6b9bc5264e7af3a2aa98735bce6a2ef29f9557b582474c5de0d0f5e6170b8")

package() {
	# Extract downloaded file
	tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

	# Change game launcher
	cat "$pkgdir/usr/games/openbve" | sed 's#/usr/bin/cli#/usr/bin/mono#' | tee "$pkgdir/usr/games/openbve"

	# Link executable to /usr/bin
	install -d "$pkgdir/usr/bin/"
	ln -sf /usr/games/openbve "$pkgdir/usr/bin/openbve"
}
