# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cdir-git
pkgver=1.3.r51.ff3e2bf
pkgrel=1
pkgdesc="A faster way to navigate folders and browse files in Windows and Linux shells."
arch=('any')
url="https://github.com/EskelinenAntti/cdir"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/EskelinenAntti/cdir.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "$(python setup.py --version).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
