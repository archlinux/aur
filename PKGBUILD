# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Arnaud Taffanel <dev@taffanel.org>
# Contributor: Victor Häggqvist <victor@snilius.com>
pkgname=solaar-git
pkgver=20151002
pkgrel=1
pkgdesc="Linux devices manager for the Logitech Unifying Receiver."
arch=('any')
url="http://pwr.github.io/Solaar/"
license=('GPL2')

depends=('python' 'python-pyudev' 'python-gobject' 'pygtk')
makedepends=('git')
provides=('solaar')
conflicts=('solaar')
install='solaar.install'
source=('git+https://github.com/pwr/Solaar.git' 'solaar.install')
md5sums=('SKIP' '4057d7179fe2ae9718b8aac4607a2c47')

package() {
	cd "$srcdir/Solaar"
	python3 setup.py install --root="$pkgdir/" --optimize=1
	install -D -m0644 rules.d/42-logitech-unify-permissions.rules \
		"$pkgdir/etc/udev/rules.d/42-logitech-unify-permissions.rules"
}

post_install() {
	xdg-icon-resource forceupdate
	update-desktop-database -q
}

