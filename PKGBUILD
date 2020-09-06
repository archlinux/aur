# Maintainer: Joe Davison <joe@warhaggis.com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>

pkgname=minigalaxy-git
pkgver=0.9.4.r66.gf7552ce
pkgrel=1
pkgdesc="A simple GOG client for Linux, git version"
provides=('minigalaxy')
conflicts=('minigalaxy')
arch=('any')
url="https://github.com/sharkwouter/minigalaxy"
license=('GPL-3')
source=('git://github.com/sharkwouter/minigalaxy.git')
md5sums=('SKIP')
depends=('python' 'python-requests' 'python-gobject' 'gtk3' 'webkit2gtk')
optdepends=('scummvm' 'dosbox' 'wine')
makedepends=('python' 'python-setuptools' 'git')

pkgver() {
	git -C minigalaxy describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

build() {
        cd "$srcdir/${pkgname%-git}"
	rm -rf tests
        python setup.py build
}
package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m 644 THIRD-PARTY-LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.md"
	install -D -m 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m 644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
