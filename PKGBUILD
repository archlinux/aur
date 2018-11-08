# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libreport
pkgver=2.9.6
pkgrel=1
pkgdesc='Generic library for reporting various problems'
arch=('i686' 'x86_64')
depends=('satyr' 'augeas' 'libtar' 'libffi' 'libnewt' 'gtk3' 'xmlto' 'xmlrpc-c' 'json-c' 'nss')
makedepends=('intltool' 'asciidoc' 'python' 'python2')
optdepends=('python: python 3.x bindings'
	'python2: python 2.x bindings')
url='https://github.com/abrt/libreport'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('23d427199f7430b64df9cee561eccba95fd4d218f99fa8363f0dfde15d7e1035')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./autogen.sh
	sed -i 's/PYTHON2_LIBS/PYTHON_LIBS/' src/report-python/Makefile.am
	sed -i 's/python-config/python2-config/' configure
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

