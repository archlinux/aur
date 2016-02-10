# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=mast
pkgver=1.5.1.0
_pkgname=mast-src-1-5-1-0
pkgrel=1
pkgdesc="Modeling and Analysis Suite for Real-Time Applications"
arch=('i686' 'x86_64')
url="http://mast.unican.es"
license=('GPL')
depends=('gtk3'
	'gtkada')
source=('http://mast.unican.es/mast-src-1-5-1-0.tar.gz'
        'xmlada-config')
md5sums=('6e90388b84c6a92a9f148b8705c73677'
         '31c59fd5ce1c915a7fc0a83a43949a43')

build() {
	cd "$srcdir/$_pkgname"
	sed -i s/xmlada-config/\.\.\\/\.\.\\/\.\.\\/xmlada-config/g mast_xml/compile
	sed -i s/xmlada-config/\.\.\\/\.\.\\/\.\.\\/xmlada-config/g mast_xml/compile_results
	./compile
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/share/{doc/mast,mast,mast_xml}
  mkdir -p $pkgdir/usr/bin

  cp mast_analysis/mast_analysis $pkgdir/usr/bin
  cp gmast/src/gmast_analysis $pkgdir/usr/bin
  cp gmast/gmast $pkgdir/usr/bin
  cp gmastresults/src/gmastresults $pkgdir/usr/bin
  cp gmasteditor/src/gmasteditor $pkgdir/usr/bin
  cp mast_xml/{mast_xml_convert,mast_xml_convert_results} $pkgdir/usr/bin
  cp pt_editor/src/gmast_pt_editor $pkgdir/usr/bin
  cp to_mast2/to_mast2 $pkgdir/usr/bin

  cp docs/* $pkgdir/usr/share/doc/mast/
  chmod +r $pkgdir/usr/share/doc/mast/*
  cp -r examples $pkgdir/usr/share/mast/
  chmod +r $pkgdir/usr/share/mast/examples/*
  cp README.txt $pkgdir/usr/share/mast/
  cp mast_xml/README.txt $pkgdir/usr/share/mast_xml
  cp mast-status.txt $pkgdir/usr/share/mast/
}
