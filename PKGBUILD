# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=systemd-manager-git
pkgver=0.4.5.r18.g5bf1bdc
pkgrel=1
pkgdesc="A program written with Rust that allows the user to manage their systemd services via a GTK3 GUI."
arch=('i686' 'x86_64')
url="https://github.com/mmstick/systemd-manager/"
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'git')
provides=('systemd-manager')
conflicts=('systemd-manager')
source=("$pkgname::git+https://github.com/mmstick/systemd-manager/#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -D -m755 target/release/systemd-manager "$pkgdir/usr/bin/systemd-manager"
	install -D -m755 assets/systemd-manager-pkexec "$pkgdir/usr/bin/systemd-manager-pkexec"
	install -D -m644 assets/systemd-manager.desktop "$pkgdir/usr/share/applications/systemd-manager.desktop"
	install -D -m644 assets/org.freedesktop.policykit.systemd-manager.policy "$pkgdir/usr/share/polkit-1/actions/org.freedesktop.policykit.systemd-manager.policy"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
