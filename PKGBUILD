# Maintainer: Valentin Weber
pkgname=sudo-is-sudo-rs
pkgver=1.0.0
pkgrel=8
pkgdesc="Metapackage to replace standard sudo binaries with sudo-rs"
arch=('any')
url="https://github.com/trifectatechfoundation/sudo-rs"
license=('GPL-3.0-or-later')
depends=('sudo-rs')
conflicts=('sudo')
provides=('sudo')
backup=('etc/pam.d/sudo' 'etc/sudoers')
source=('sudo.pam'
				'sudoers')
sha256sums=('962deaf1a161721b3aeb0509bb7742c4d3fe89807d54b311775a9e45c3d6c3c0'
            '37dfee73bdc06c35d7b0b6bc072cd2e5ecb80b9937b4b6f76dae2a8056edfc45')

package() {

	install -dm 755 "${pkgdir}/etc/pam.d"
	install -dm 755 "${pkgdir}/usr/bin"

	ln -s /usr/bin/sudo-rs "${pkgdir}/usr/bin/sudo"
	ln -s /usr/bin/sudoedit-rs "${pkgdir}/usr/bin/sudoedit"
	ln -s /usr/bin/visudo-rs "${pkgdir}/usr/bin/visudo"

	install -Dm 644 "${srcdir}/sudo.pam" "${pkgdir}/etc/pam.d/sudo"
	install -Dm 640 "${srcdir}/sudoers" "${pkgdir}/etc/sudoers"

	install -dm 750 "${pkgdir}/etc/sudoers.d"
}
