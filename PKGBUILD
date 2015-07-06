# maintainer Ivan Agarkov ( ivan.agarkov@gmail.com )

pkgname=husky-all
pkgver=1.9_20150211
pkgrel=1
pkgdesc="Complete build for Husky Fido Tosser 1.9"
arch=('i686' 'x86_64')
license=('GPL')
url="http://husky.sourceforge.net/hpt.html"
source=('huskymak.cfg'
  'areastat_makefile'
  'msged_makefile'
  'msged_maps_makefile'
  'nltools_makefile'
  'smapi_makefile'
  'http://downloads.sourceforge.net/project/husky/husky/1.9-current/2015.02.11/husky-all-1.9-source-20150211.tgz')

md5sums=('189e2dbe6704b9d30dd1f133371f017e'
         '0ec212f2bb31d149cd1717ab681f519a'
         '4948d9881b44763e03379f66260e96af'
         'afc785cc2418634c418dbdcc4afa975d'
         '48ba1f5f4ded114e500ef83ce1fe407a'
         'c7238eec644bd1aeaf0a0c993f5dd8fc'
         '6dc36f0c2d0a49a603a107035ba5f07a')
package() {
    cp -f ../huskymak.cfg "$srcdir/husky/"
    cp -f ../areastat_makefile "$srcdir/husky/areastat/Makefile"
    cp -f ../msged_makefile "$srcdir/husky/msged/Makefile"
    cp -f ../msged_maps_makefile "$srcdir/husky/msged/maps/makefile.husky"
    cp -f ../nltools_makefile "$srcdir/husky/nltools/Makefile"
    cp -f ../smapi_makefile "$srcdir/husky/smapi/Makefile"
    for PROJ in huskylib smapi fidoconf areafix hpt htick areastat bsopack msged nltools; do
	cd "$srcdir/husky/$PROJ"
	( make && make DESTDIR="$pkgdir" install ) || exit -1
    done
}
