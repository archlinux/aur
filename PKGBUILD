# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=systemd-manager-git
pkgver=r29.724a5e2
pkgrel=1
pkgdesc="A program written with RUST that allow the user to manage their systemd services via a GTK3 GUI."
arch=('i686' 'x86_64')
url="https://github.com/mmstick/systemd-manager/"
license=('GPL2')
depends=('gtk3')
makedepends=('cargo')
provides=('systemd-manager')
source=("$pkgname::git+https://github.com/mmstick/systemd-manager/#branch=master")
md5sums=('SKIP')

pkgver() {
     cd "$srcdir/$pkgname"
	 echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
     cd "$srcdir/$pkgname"
     # sh install.sh
     cargo build --release
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 target/release/systemd-manager "$pkgdir/usr/local/bin/systemd-manager"
	install -D -m755 systemd-manager-pkexec "$pkgdir/usr/local/bin/systemd-manager-pkexec"
     	install -D -m644 systemd-manager.desktop "$pkgdir/usr/share/applications/systemd-manager.desktop"
     	install -D -m644 org.freedesktop.policykit.systemd-manager.policy "$pkgdir/usr/share/polkit-1/actions/org.freedesktop.policykit.systemd-manager.policy"
     	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
     	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
