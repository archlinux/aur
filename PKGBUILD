# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
_projectname='azure-monitor-ingestion'
pkgname="python-$_projectname"
pkgver='1.0.4'
pkgrel='2'
pkgdesc='Microsoft Azure Monitor Ingestion Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.8.0' 'python-azure-core>=1.28.0' 'python-isodate>=0.6.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_projectname}_$pkgver.tar.gz")
b2sums=('85513b1f2620321b3fce8d38c92065f4de155599592faf589d958e81be549c68b5e4714ce0a1a5b33740c6322d76d6ebc8972b6810727e42b310bccb56f3fd57')

_sourcedirectory="azure-sdk-for-python-${_projectname}_$pkgver/sdk/monitor/$_projectname"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

# Tests ignored, as the devtools_testutils package is not supposed to be released/published (see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=261305)

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
