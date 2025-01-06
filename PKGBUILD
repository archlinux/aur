# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=4store
pkgver=1.1.7
pkgrel=1
pkgdesc="Efficient, scalable and stable RDF database"
arch=('i686' 'x86_64')
url="https://github.com/4store/4store"
license=('GPL')
depends=('raptor' 'rasqal' 'glib2' 'libxml2' 'pcre' 'avahi' 'readline' 'ncurses' 'termcap' 'expat' 'zlib')
options=('!emptydirs')
#source=("http://4store.org/download/${pkgname}-v${pkgver}.tar.gz")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0ebe22f9bc7c648081a67fe9b3ad1adf')

prepare()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	echo "${pkgver}" >> .version
	./autogen.sh
	./configure --prefix=/usr
	sed -i 's/#define _XOPEN_SOURCE/#define _GNU_SOURCE/' src/frontend/filter-datatypes.c
	sed -i 's/GStaticMutex rasqal_mutex/extern GStaticMutex rasqal_mutex/' src/frontend/query.h
}

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	LDFLAGS=-Wl make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}
