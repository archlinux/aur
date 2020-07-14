# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=ini_file_manager
pkgver=9
pkgrel=1
pkgdesc="Ini configuration file reader and manipulator package for Ada."

arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ini-files"
license=('MIT')

depends=('gcc-ada')

source=('https://sourceforge.net/projects/ini-files/files/ini-files/ini-files-09.zip'
        'construct.gpr'
        'example.gpr'
        'ini_file_manager.gpr')

md5sums=('886bb490c5044e2c8821b36a8efbd08d'
         '46b6eed7c165ec32161fee42c3d61abc'
         'c5cef25a5de24ec035905174b76e0fd1'
         '1940fe0de2234a7b451fa98200f082c7')


prepare()
{
   cd "$srcdir"

   mkdir -p obj
   mkdir -p src
   mv ini/config.ad[bs] src
}


build() 
{
   cd "$srcdir"

   gnatmake -p -Pconstruct
}


package() 
{
   cd "$srcdir"
	
   STAGEDIR=$pkgdir
   FILESDIR=$srcdir
   PREFIX=/usr

   mkdir -p ${STAGEDIR}${PREFIX}/lib/gnat             \
            ${STAGEDIR}${PREFIX}/lib/ini_file_manager \
            ${STAGEDIR}${PREFIX}/include/ini_file_manager

	install ${FILESDIR}/ini_file_manager.gpr \
		${STAGEDIR}${PREFIX}/lib/gnat

	install src/* \
		${STAGEDIR}${PREFIX}/include/ini_file_manager

	install lib/*  \
		${STAGEDIR}${PREFIX}/lib/ini_file_manager  
}
