# Maintainer: Groctel <aur@taxorubio.com>

_name=cloup

pkgname=python-cloup
pkgver=3.0.1
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=('any')
license=('MIT')
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('31e5b348aaaab5905b4c7dff4e7a6a8c9f0f398267e67d5843a28a9bc9779efe6073fcf9a7a57bdebe286acf8e475eb62ba7f6755402b74b11da2d9f6e49fa6c')

depends=(
	"python"
	"python-click"
	"python-typing_extensions"
)
makedepends=(
	"python-setuptools"
	"python-setuptools-scm"
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
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
