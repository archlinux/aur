pkgname=sarif-tools
pkgver=1.0.0
pkgrel=1
pkgdesc='A set of Python command line tools for working with SARIF files produced by code analysis tools'
arch=('any')
url=https://github.com/microsoft/sarif-tools
license=('MIT')
depends=('python-docx' 'python-jinja' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e814d8249f6751f174d012c240b02601b877b78e5c4fe5dd00b30dc796f01ee4')

build() {
	cd $pkgname-$pkgver
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd $pkgname-$pkgver
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	ln -s "$site_packages"/$pkgname-$pkgver.dist-info/LICENSE \
	   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
