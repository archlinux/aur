# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libreport
pkgver=2.6.2
pkgrel=1
pkgdesc='Generic library for reporting various problems'
arch=('i686' 'x86_64')
depends=('satyr' 'augeas' 'libtar' 'libffi' 'libnewt' 'gtk3' 'xmlto' 'xmlrpc-c' 'json-c')
makedepends=('intltool' 'asciidoc' 'python' 'python2')
optdepends=('python: python 3.x bindings'
	'python2: python 2.x bindings')
url='https://github.com/abrt/libreport'
license=('GPL')
source=("https://fedorahosted.org/released/abrt/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7d26a39b3a6f9c69ccd6def1d68ab8d369be06ffa18e8696c70c7cd73e90cd92')

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

