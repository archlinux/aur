# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-identity'
pkgname="python-$_projectname"
pkgver='1.19.0'
pkgrel='1'
pkgdesc='Microsoft Azure Identity Client Library for Python'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python'
license=('MIT')
depends=('python>=3.8.0' 'python-azure-core>=1.31.0' 'python-cryptography>=2.5.0' 'python-msal>=1.30.0' 'python-msal-extensions>=1.2.0' 'python-typing_extensions>=4.0.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_projectname}_$pkgver.tar.gz")
b2sums=('65f79d89ee0190e22ebcb18d6761c395adfd97c845f753a1c2c4ec8f964698ccd0dae7c18acad1232075f063e48a3ee28b0462fcd5717dc33953867a49d50ce6')

_sourcedirectory="azure-sdk-for-python-${_projectname}_$pkgver/sdk/identity/$_projectname"

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
