# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.6.r6.gac85ac4
pkgrel=1
pkgdesc="Securely and easily download, verify, install and launch Tor Browser"
arch=('any')
url="https://github.com/micahflee/torbrowser-launcher"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-requests' 'python-pysocks' 'python-gpgme'
         'gnupg' 'tor' 'hicolor-icon-theme' 'dbus-glib')
makedepends=('git' 'python-setuptools' 'python-distro')
optdepends=('apparmor: support for apparmor profiles')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/micahflee/torbrowser-launcher.git#branch=main')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
