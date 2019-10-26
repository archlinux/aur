# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.2.r20.20b02d0
pkgrel=1
pkgdesc="Securely and easily download, verify, install, and launch Tor Browser"
arch=('any')
url="https://github.com/micahflee/torbrowser-launcher"
license=('MIT')
depends=('tor' 'gnupg' 'pygtk' 'python-gnupg' 'python-gpgme' 'python-pyqt5' 'python-twisted')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/micahflee/torbrowser-launcher.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
