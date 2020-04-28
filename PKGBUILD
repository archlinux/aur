# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon

pkgname=nicotine-plus-git
pkgver=1.4.1.r33.g7652f169
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="http://nicotine-plus.org"
license=('GPL3')
depends=('pygtk' 'python2-mutagen')
makedepends=('git' 'python2')
optdepends=('miniupnpc: UPnP support'
            'python2-geoip: for geo-blocker'
            'python2-notify: for notifications')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=("git+https://github.com/Nicotine-Plus/nicotine-plus.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
