# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=isolyzer
pkgver=1.4.0
pkgrel=2
epoch=
pkgdesc="Verify size of ISO image for consistency with file system (ISO 9660, UDF, HFS, HFS+) header fields"
arch=('any')
url="https://github.com/KBNLresearch/isolyzer"
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-lxml' 'python-pytest')
depends=('python')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('39e29be05cba4d73bc68e5726ba4f0d8042ff5f01eb1dc265248546fdaf1acd3')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    # Broken for now, see https://github.com/KBNLresearch/isolyzer/issues/30
    # pytest
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
