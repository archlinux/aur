# Maintainer: Groctel <aur@taxorubio.com>

_name=glcontext

pkgname=python-glcontext
pkgver=2.4.0
pkgrel=1
pkgdesc="A library providing OpenGL implementation for ModernGL on multiple platforms."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/glcontext"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d69adbee5f31d7b870b566f59d2b796a7436ab57ad29c4fe1210ec1e40b782e4705c81ba17a921217f28c5fcb4f9c759c2ebf146bda1af4fd54007c868425427')

depends=('python')
makedepends=(
	'libx11'
	'python-setuptools'
)

build ()
{
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
