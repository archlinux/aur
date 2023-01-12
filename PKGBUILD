# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=px_ptop
pkgver=3.1.0
pkgrel=2
pkgdesc="ps and top for Human Beings"
arch=('any')
url="https://github.com/walles/px"
license=('MIT')
depends=('python')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	curl -Ls https://github.com/walles/px/raw/python/install.sh > install.sh
	sed -i 's/sudo//' install.sh
	sed -i "s|/usr/local/bin|$pkgdir/usr/bin|" install.sh
	bash install.sh

	# The script installs two identical binaries. Fix this
	rm "$pkgdir/usr/bin/ptop"
	ln -s "$pkgdir/usr/bin/px" "$pkgdir/usr/bin/ptop"

	# Install license from latest github LICENSE
	curl -Ls https://raw.githubusercontent.com/walles/px/python/LICENSE > LICENSE
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
