# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
pkgname=calcure
pkgver=3.1
pkgrel=1
pkgdesc='Modern TUI calendar and task manager'
arch=('any')
url=https://github.com/anufrievroman/calcure
license=('MIT')
depends=('python-holidays' 'python-jdatetime' 'python-icalendar' 'python-taskw')
makedepends=('python-build' 'python-installer' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ca305f8319eef697f8aacd315897072f462bc1c604bfcb694144bddadca1bb03')

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
