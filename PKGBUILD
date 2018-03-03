# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>

_pkgname=libreport
pkgname=$_pkgname-git
pkgver=155127e
pkgrel=1
pkgdesc='Generic library for reporting various problems'
arch=('i686' 'x86_64')
depends=('satyr' 'augeas' 'libtar' 'libffi' 'libnewt' 'gtk3' 'xmlto' 'xmlrpc-c' 'json-c' 'nss')
makedepends=('intltool' 'asciidoc' 'python' 'python2')
optdepends=('python: python 3.x bindings'
	'python2: python 2.x bindings')
url='https://github.com/abrt/libreport'
license=('GPL')
source=("git+https://github.com/abrt/libreport.git")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"

	./autogen.sh
	sed -i 's/PYTHON2_LIBS/PYTHON_LIBS/' src/report-python/Makefile.am
	sed -i 's/python-config/python2-config/' configure
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}/" install
}


