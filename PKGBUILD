# Contributor: Patrick Kelly <kameo76890 at gmail dot com>
# Contributor: Georgios  Tsalikis <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=xmlada
pkgver=2016
pkgrel=2
pkgdesc="A full XML suite for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/xmlada/"
license=('GPL')

depends=("gcc-ada")

source=(http://mirrors.cdn.adacore.com/art/57399978c7a447658e0affc0
        patch-aclocal.m4
        patch-Makefile.in)

sha1sums=('a9c840d9d05ed865aa7c960d9f27cf7cd93e12b9'
          '20fa4ccacd2cebd2b0b349dc11371730a50a0fd2'
          '33ac945685c79befd86c3c4f6093202a5e7b209a')



prepare()
{
  cd $srcdir/$pkgname-gpl-$pkgver-src
	
  patch -p0 -i ../patch-aclocal.m4
  patch -p0 -i ../patch-Makefile.in

}



build()
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  autoconf
  ./configure --prefix=/usr
  make static relocatable


  rm -fr lib
  mkdir -p lib/xmlada/xmlada_dom.relocatable

  cp ./dom/lib/relocatable/libxmlada_dom.so                          lib/xmlada/xmlada_dom.relocatable
  cp ./dom/lib/relocatable/libxmlada_dom.so.2016                     lib/xmlada/xmlada_dom.relocatable
  cp ./input_sources/lib/relocatable/libxmlada_input_sources.so      lib/xmlada/xmlada_input.relocatable
  cp ./input_sources/lib/relocatable/libxmlada_input_sources.so.2016 lib/xmlada/xmlada_input.relocatable
  cp ./sax/lib/relocatable/libxmlada_sax.so                          lib/xmlada/xmlada_sax.relocatable
  cp ./sax/lib/relocatable/libxmlada_sax.so.2016                     lib/xmlada/xmlada_sax.relocatable
  cp ./schema/lib/relocatable/libxmlada_schema.so                    lib/xmlada/xmlada_schema.relocatable
  cp ./schema/lib/relocatable/libxmlada_schema.so.2016               lib/xmlada/xmlada_schema.relocatable
  cp ./unicode/lib/relocatable/libxmlada_unicode.so                  lib/xmlada/xmlada_unicode.relocatable
  cp ./unicode/lib/relocatable/libxmlada_unicode.so.2016             lib/xmlada/xmlada_unicode.relocatable

  ln -s xmlada/xmlada_dom.relocatable/libxmlada_dom.so.2016               lib/libxmlada_dom.so.2016
  ln -s xmlada/xmlada_input.relocatable/libxmlada_input_sources.so.2016   lib/libxmlada_input_sources.so.2016
  ln -s xmlada/xmlada_sax.relocatable/libxmlada_sax.so.2016               lib/libxmlada_sax.so.2016
  ln -s xmlada/xmlada_schema.relocatable/libxmlada_schema.so.2016         lib/libxmlada_schema.so.2016
  ln -s xmlada/xmlada_unicode.relocatable/libxmlada_unicode.so.2016       lib/libxmlada_unicode.so.2016
}



INSTALL_DATA=install
INSTALL_SCRIPT=install

package() 
{
  cd $srcdir/$pkgname-gpl-$pkgver-src

  STAGEDIR=$pkgdir
  PREFIX=/usr
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src


	mkdir -p \
        ${STAGEDIR}${PREFIX}/bin \
        ${STAGEDIR}${PREFIX}/include/xmlada \
		${STAGEDIR}${PREFIX}/lib/gnat \
		${STAGEDIR}${PREFIX}/share/gps/plug-ins \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_dom.relocatable \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_input.relocatable \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_sax.relocatable \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_schema.relocatable \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_unicode.relocatable \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_dom.static \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_input.static \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_sax.static \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_schema.static \
        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_unicode.static \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_dom.relocatable \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_input.relocatable \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_sax.relocatable \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_schema.relocatable \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_unicode.relocatable \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_dom.static \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_input.static \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_sax.static \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_schema.static \
        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_unicode.static

#		${STAGEDIR}${DOCSDIR}


	${INSTALL_DATA} ${WRKSRC}/dom/*.ad[bs]           ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_dom.relocatable
	${INSTALL_DATA} ${WRKSRC}/input_sources/*.ad[bs] ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_input.relocatable
	${INSTALL_DATA} ${WRKSRC}/sax/*.ad[bs]           ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_sax.relocatable
	${INSTALL_DATA} ${WRKSRC}/schema/*.ad[bs]        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_schema.relocatable
	${INSTALL_DATA} ${WRKSRC}/unicode/*.ad[bs]       ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_unicode.relocatable

	${INSTALL_DATA} ${WRKSRC}/dom/*.ad[bs]           ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_dom.static
	${INSTALL_DATA} ${WRKSRC}/input_sources/*.ad[bs] ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_input.static
	${INSTALL_DATA} ${WRKSRC}/sax/*.ad[bs]           ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_sax.static
	${INSTALL_DATA} ${WRKSRC}/schema/*.ad[bs]        ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_schema.static
	${INSTALL_DATA} ${WRKSRC}/unicode/*.ad[bs]       ${STAGEDIR}${PREFIX}/include/xmlada/xmlada_unicode.static

	${INSTALL_DATA} ${WRKSRC}/dom/lib/relocatable/*           ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_dom.relocatable
	${INSTALL_DATA} ${WRKSRC}/input_sources/lib/relocatable/* ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_input.relocatable
	${INSTALL_DATA} ${WRKSRC}/sax/lib/relocatable/*           ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_sax.relocatable
	${INSTALL_DATA} ${WRKSRC}/schema/lib/relocatable/*        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_schema.relocatable
	${INSTALL_DATA} ${WRKSRC}/unicode/lib/relocatable/*       ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_unicode.relocatable

	${INSTALL_DATA} ${WRKSRC}/dom/lib/static/*           ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_dom.static
	${INSTALL_DATA} ${WRKSRC}/input_sources/lib/static/* ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_input.static
	${INSTALL_DATA} ${WRKSRC}/sax/lib/static/*           ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_sax.static
	${INSTALL_DATA} ${WRKSRC}/schema/lib/static/*        ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_schema.static
	${INSTALL_DATA} ${WRKSRC}/unicode/lib/static/*       ${STAGEDIR}${PREFIX}/lib/xmlada/xmlada_unicode.static


	${INSTALL_DATA}                \
        ${WRKSRC}/distrib/xml*.gpr \
        ${WRKSRC}/dom/xml*.gpr \
        ${WRKSRC}/input_sources/xml*.gpr \
        ${WRKSRC}/sax/xml*.gpr \
        ${WRKSRC}/schema/xml*.gpr \
        ${WRKSRC}/unicode/xml*.gpr \
		${STAGEDIR}${PREFIX}/lib/gnat


    mv lib/libxmlada_dom.so.2016           ${STAGEDIR}${PREFIX}/lib
    mv lib/libxmlada_input_sources.so.2016 ${STAGEDIR}${PREFIX}/lib
    mv lib/libxmlada_sax.so.2016           ${STAGEDIR}${PREFIX}/lib
    mv lib/libxmlada_schema.so.2016        ${STAGEDIR}${PREFIX}/lib
    mv lib/libxmlada_unicode.so.2016       ${STAGEDIR}${PREFIX}/lib
}
