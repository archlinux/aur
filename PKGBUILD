# Maintainer: Groctel <aur@taxorubio.com>

_name=glcontext

pkgname=python-glcontext
pkgver=2.3.7
pkgrel=1
pkgdesc="A library providing OpenGL implementation for ModernGL on multiple platforms."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/glcontext"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('f2d597dc338c9dab911494d2249fdbb400af0e79e101c0cacb53418af4ac4f4cc261cc22dd6685102401ece6dada193769840eb5836cb03119313a8770cc09e9')

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
