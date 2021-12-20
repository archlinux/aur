# Maintainer: Mikaela Szekely <qyriad@gmail.com>

_pkgname=injector
pkgname=python-${_pkgname}-git
pkgver='0.14.1.r3.5d041fd'
pkgrel=1
pkgdesc='Python dependency injection framework, inspired by Guice'
arch=('any')
url='https://github.com/alecthomas/injector'
license=('BSD')
makedepends=('python-setuptools' 'python-pypandoc')
depends=('python')
provides=('python-injector')
conflicts=('python-injector')
source=("git+https://github.com/alecthomas/injector.git")
sha256sums=('SKIP')

pkgver()
{
	cd $srcdir/injector
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build()
{
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package()
{
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
