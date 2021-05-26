
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=picomc-git
_pkgname=${pkgname%-*}
pkgver=v0.4.2.r12.g64285b3
pkgrel=1
pkgdesc='A tiny CLI Minecraft launcher'
arch=('any')
url='https://github.com/sammko/picomc'
license=('MIT')
depends=(
	'python>=3.7.0'
	'python-click>=7.0.0'
	'python-requests'
	'python-urllib3'
	'python-certifi'
	'python-tqdm'
	'python-coloredlogs'
	'java-runtime'
)
provides=('picomc')
conflicts=('picomc')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
