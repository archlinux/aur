# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=python-scikit-learn-git
pkgver=0.19.branching.r8706.2164bb16b9
pkgrel=1
pkgdesc="A set of Python modules for machine learning and data mining"
arch=(x86_64)
url='https://scikit-learn.org/'
license=('BSD')
depends=('python-scipy' 'python-joblib' 'python-threadpoolctl')
optdepends=('python-matplotlib: plotting capabilities')
makedepends=('git' 'python-setuptools' 'cython' 'openmp')
provides=('python-scikit-learn')
conflicts=('python-scikit-learn')
options=(!emptydirs)
source=('git+https://github.com/scikit-learn/scikit-learn.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/scikit-learn"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/scikit-learn"
	python setup.py build
}

package() {
	cd "$srcdir/scikit-learn"

	python setup.py install --root="$pkgdir/" --optimize=1

	install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# See FS#49651
	install -d "$pkgdir/usr/share/doc/$pkgname"
}
