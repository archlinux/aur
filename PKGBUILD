# Maintainer: Your Name <mart@martlubbers.net>
pkgname=netctltray
pkgver=0.2
pkgrel=1
pkgdesc="Tray icon to switch netctl profiles."
arch=('any')
url="https://github.com/dopefishh/netctl-tray"
license=('custom')
depends=('python' 'python-pyside')
optdepends=('x11-ssh-askpass: Graphical password entry'
	    'sudo: Get permission to run netctl')
install=netctltray.install
source=('netctltray.install')
source+=("https://github.com/dopefishh/netctl-tray/archive/${pkgver}a.tar.gz")
md5sums=('8d4a5c22de4ae9c1c3dcdea32d2359e4' '74b877fb907b2e74183416e0dfcb17e6')

package() {
	cd netctl-tray-0.2a
	gzip -9v netctltray.1
	install -vd "$pkgdir"{/opt/netctltray/,/usr/{bin,share/{licenses/netctltray,/man/man1}}}
	install -vm 755 netctltray.py "$pkgdir"/opt/netctltray/
	install -vm 644 netctltray.1.gz "$pkgdir"/usr/share/man/man1/
	install -vm 644 licence "$pkgdir"/usr/share/licenses/netctltray/
	install -vm 644 netctl.py check.svg icon.svg "$pkgdir"/opt/netctltray/
	ln -sf /opt/netctltray/netctltray.py "$pkgdir"/usr/bin/netctltray
}
