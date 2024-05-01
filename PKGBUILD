# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=django-huey
pkgname=python-$_pyname
pkgver=1.2.0
pkgrel=1
pkgdesc='An extension for django and huey that supports multi queue management'
arch=(any)
url="https://github.com/gaiacoop/$_pyname"
license=(MIT)
depends=(python
         python-huey
         python-django)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('98c794258da239f33c3bb4f40557467399ce20b0190d12f059f9f94a05cf58d4')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
