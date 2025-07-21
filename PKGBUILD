# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
_projectname='azure-monitor-ingestion'
pkgname="python-$_projectname"
pkgver='1.1.0'
pkgrel='1'
pkgdesc='Microsoft Azure Monitor Ingestion Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.9.0' 'python-azure-core>=1.28.0' 'python-isodate>=0.6.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_projectname}_$pkgver.tar.gz")
b2sums=('7a044c9ad568a0112bfe2e41ba037f17b25014b04595524304a9913afda19216d872277b3b891d211b177e233038b154bda8e6c2d5b73a0ca5f762db9fd4b57d')

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
