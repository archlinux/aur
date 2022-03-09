# Maintainer: Groctel <aur@taxorubio.com>

_name=glcontext

pkgname=python-glcontext
pkgver=2.3.5
pkgrel=2
pkgdesc="A library providing OpenGL implementation for ModernGL on multiple platforms."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/glcontext"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('dddef776508e6925d98b78b186c83f9ad50ebcad1b1f8e86b491c3252a2d87216a2560e0edcdc3d7a9613427bc1b447dbcf3dea7eb60ee3390dbfe8ac57cd358')

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
