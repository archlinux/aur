
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-scienceplots-git
_pkgname=${pkgname%-*}
_name='SciencePlots'
pkgver=1.0.9.r7.g41d5215
pkgrel=1
pkgdesc='Matplotlib styles for scientific plotting.'
arch=('any')
url='https://github.com/garrettj403/SciencePlots'
license=('MIT')
depends=('python' 'python-matplotlib')
makedepends=('python-setuptools')
conflicts=('python-scienceplots')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_name"
	python setup.py build
}

package() {
	cd "$srcdir/$_name"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
