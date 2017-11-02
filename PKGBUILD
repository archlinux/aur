# Maintainer: Shi Liang <shilianggoo@gmail.com>
pkgname=python-caiman-git
pkgver=r1421.dd9c889
pkgrel=1

pkgdesc=" A Computational toolbox for large scale Calcium Imaging data Analysis and behavioral analysis. "

arch=('x86_64')
url="https://github.com/simonsfoundation/CaImAn.git"
license=('GPL')
groups=()
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-image'  'python-scikit-learn'
	'ipython-ipyparallel' 'opencv' 'python-tifffile' 'python-peakutils')
makedepends=('git' 'cython')
checkdepends=()
optdepends=('python-cvxpy' 'python-spams-svn')
options=()
source=("$pkgname-$pkgver::git+${url}")
md5sums=('SKIP')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build_ext
	python setup.py build
}


pkgver() {
	cd "$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root=${pkgdir} --prefix=/usr
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}

