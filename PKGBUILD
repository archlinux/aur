# Contributor: Christian Hesse <mail@eworm.de>

pkgname=libreport
pkgver=2.17.10
pkgrel=1
pkgdesc='Generic library for reporting various problems'
arch=('i686' 'x86_64')
depends=('satyr' 'augeas' 'libtar' 'libffi' 'libnewt' 'gtk3' 'xmlto' 'xmlrpc-c' 'json-c' 'nss')
makedepends=('intltool' 'asciidoc' 'python')
optdepends=('python: python 3.x bindings')
url='https://github.com/abrt/libreport'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('19f4052f444107fbfe8265e7d926dc02169fc03773acee76dfbe3df576fc20be')


prepare() {
	cd "${pkgname}-${pkgver}"

	./autogen.sh
	sed -i 's/PYTHON2_LIBS/PYTHON_LIBS/' src/report-python/Makefile.am
	sed -i 's/python-config/python2-config/' configure
	./configure --prefix=/usr
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}

