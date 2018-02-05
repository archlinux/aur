# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=4store
pkgver=1.1.6
pkgrel=2
pkgdesc="Efficient, scalable and stable RDF database"
arch=('i686' 'x86_64')
url="http://www.4store.org"
license=('GPL')
depends=('raptor' 'rasqal' 'glib2' 'libxml2' 'pcre' 'avahi' 'readline' 'ncurses' 'termcap' 'expat' 'zlib')
options=('!emptydirs')
#source=("http://4store.org/download/${pkgname}-v${pkgver}.tar.gz")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('96c1f051ebe2ba799c064f89fc06633f')

prepare()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	echo '1.1.6' >> .version
	./autogen.sh
	./configure --prefix=/usr
	sed -i 's/#define _XOPEN_SOURCE/#define _GNU_SOURCE/' src/frontend/filter-datatypes.c
}

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}
