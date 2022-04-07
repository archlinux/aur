# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-glad
pkgver=0.1.36
pkgrel=1
pkgdesc='Multi-language GL/GLES/EGL/GLX/WGL loader-generator'
arch=('any')
url='https://github.com/Dav1dde/glad'
license=('MIT' 'Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/glad/glad-$pkgver.tar.gz")
sha256sums=('3fb00dbfec7ae6ddbeba04e21547f67f3ccfc795fc34562450cf3f2bb19fdbc7')

build() {
	cd "glad-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "glad-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/glad-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
