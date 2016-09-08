# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libreport
pkgver=2.7.2
pkgrel=1
pkgdesc='Generic library for reporting various problems'
arch=('i686' 'x86_64')
depends=('satyr' 'augeas' 'libtar' 'libffi' 'libnewt' 'gtk3' 'xmlto' 'xmlrpc-c' 'json-c' 'nss')
makedepends=('intltool' 'asciidoc' 'python' 'python2')
optdepends=('python: python 3.x bindings'
	'python2: python 2.x bindings')
url='https://github.com/abrt/libreport'
license=('GPL')
source=("https://fedorahosted.org/released/abrt/${pkgname}-${pkgver}.tar.gz")
sha256sums=('88d79b0c5fe2e87acabeb99707207f027ccb705cb4721226014fdd0d7703f0cb')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i 's/PYTHON2_LIBS/PYTHON_LIBS/' src/report-python/Makefile.am
	sed -i 's/python-config/python2-config/' configure
	export PYTHON='/usr/bin/python2' PYTHON_CONFIG='/usr/bin/python2-config'
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

