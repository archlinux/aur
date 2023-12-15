# Contributor: Christian Hesse <mail@eworm.de>

pkgname=libreport
pkgver=2.17.11
pkgrel=1
pkgdesc='Generic library for reporting various problems'
arch=('i686' 'x86_64')
depends=('satyr' 'augeas' 'libtar' 'libffi' 'libnewt' 'gtk3' 'xmlto' 'xmlrpc-c' 'json-c' 'nss')
makedepends=('intltool' 'asciidoc' 'python')
optdepends=('python: python 3.x bindings')
url='https://github.com/abrt/libreport'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz"
        '0001-Fix-compatibility-with-libxml2-2.12.patch')
sha256sums=('89b74b6e4204297c04de8751f11f60ac116b047b6fa5f579bc2a3ea651840b62'
            '81ed41029ea35b1c3342dd41725d7814fb63b040cda881793a773202f4073ff8')


prepare() {
	cd "${pkgname}-${pkgver}"

	patch -Np1 -i ../0001-Fix-compatibility-with-libxml2-2.12.patch
	./autogen.sh
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

