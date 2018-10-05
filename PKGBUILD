# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=ini_file_manager
pkgver=8
pkgrel=1
pkgdesc="Ini configuration file reader and manipulator package for Ada."

arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ini-files"
license=('MIT')

depends=('gcc-ada')

source=('https://sourceforge.net/projects/ini-files/files/ini-files/ini-files-08.zip'
        'construct.gpr'
        'example.gpr'
        'ini_file_manager.gpr'
        'runme.sh.in')

md5sums=('72f415eedf3c97d8db8df2354ca59b36'
         '46b6eed7c165ec32161fee42c3d61abc'
         'c5cef25a5de24ec035905174b76e0fd1'
         '1940fe0de2234a7b451fa98200f082c7'
         'f16d8cbcf89927dda6a2112f60410f76')


prepare()
{
   cd "$srcdir"

   mkdir -p obj
   mkdir -p src
   mv config.ad[bs] src
   sed -e "s,@PREFIX@,${LOCALBASE},g" runme.sh.in \
      > runme.sh
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
