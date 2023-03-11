pkgname=calcure
pkgver=2.8.2
pkgrel=1
pkgdesc='Modern TUI calendar and task manager'
arch=('any')
url=https://github.com/anufrievroman/calcure
license=('MIT')
depends=('python-holidays' 'python-jdatetime' 'python-ics')
makedepends=('python-build' 'python-installer' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('201ade9360d3298c51614887772489f450a42faa80f2ee0918f256aebbb3bd5e')

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
