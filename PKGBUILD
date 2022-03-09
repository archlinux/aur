# Maintainer: Groctel <aur@taxorubio.com>

_name=glcontext

pkgname=python-glcontext
pkgver=2.3.5
pkgrel=3
pkgdesc="A library providing OpenGL implementation for ModernGL on multiple platforms."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/glcontext"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7a09092af67f69856ed8e0be8409cd25ee6b7521c1effc6eda35a231edce96f86a0555da15c9da73f4009db78689d118cd9352375198058bab8857be9fb49c03')

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
