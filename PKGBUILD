# Maintainer: Aseem Athale <athaleaseem@gmail.com>
_projectname='azure-search-documents'
pkgname="python-$_projectname"
pkgver='11.6.0'
pkgrel='1'
pkgdesc='Microsoft Azure Cognitive Search Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python' 'python-azure-core' 'python-isodate' 'python-azure-common' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_projectname}_$pkgver.tar.gz")
b2sums=('08effdf081eb99efac12434eae77873ce021301d51b1c5c64b9e765c795974e953907e72db43174fcac1bf1a0134425b3ed166cde2fe585bd7d2d29cc2827f49')

_sourcedirectory="azure-sdk-for-python-${_projectname}_$pkgver/sdk/search/$_projectname"

build() {
	cd "$srcdir/$_sourcedirectory/"
  python -m build --wheel --no-isolation
}

# Tests ignored, as the devtools_testutils package is not supposed to be released/published (see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=261305)

package() {
	cd "$srcdir/$_sourcedirectory/"
  python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
