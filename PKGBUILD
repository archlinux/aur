# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=python-primp
_name=primp
pkgver=0.9.2
pkgrel=1
pkgdesc='HTTP client that can impersonate web browsers, mimicking their headers and `TLS/JA3/JA4/HTTP2` fingerprints'
arch=('any')
url=https://github.com/deedy5/primp
license=('MIT')
depends=()
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel' 'clang')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5b95666c25b9107eab3c05a89cb7b1748d5122e57c57b25bfc3249d525c45300')

build() {
	cd $_name-$pkgver
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd $_name-$pkgver
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
	   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
