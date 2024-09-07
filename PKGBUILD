pkgname=python-nodriver
_name=nodriver
pkgver=0.36
pkgrel=1
pkgdesc='Successor of Undetected-Chromedriver.'
arch=('any')
url=https://github.com/UltrafunkAmsterdam/nodriver
license=('GPL3')
depends=('python-mss' 'python-deprecated' 'python-websockets')
makedepends=('python-build' 'python-installer' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('69cd7847d6d7bfe3bc8498adc2c0a0b54649267edd085c4adbf88949f790cc23')

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
