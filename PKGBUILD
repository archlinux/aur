# Maintainer: Groctel <aur@taxorubio.com>

_name=glcontext

pkgname=python-glcontext
pkgver=2.3.5
pkgrel=1
pkgdesc="A library providing OpenGL implementation for ModernGL on multiple platforms."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/glcontext"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('88184847466434e0f0734341612f2cdc5822caf26511087a623a8eeb63556f0f874651f9da04001f4481cb5fc73887c2c7cf437d58626e309fd12d2f8e94a1f5')

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
