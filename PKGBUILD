# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mapivi-svn
pkgver=r428
pkgrel=2
pkgdesc="A photo management tool with focus on JPEG pictures (dev version)"
depends=('jpegpixi' 'jhead' 'imagemagick' 'libjpeg' 'perl-image-info' 'perl-image-metadata-jpeg' 'tk-matchentry' 'tk-resizebutton' 'tk-splash' 'perl-tk' 'perl-exiftool')
arch=('i686' 'x86_64')
license=('GPL')
url="http://mapivi.sourceforge.net/mapivi.shtml"
source=("${pkgname}::svn+https://svn.code.sf.net/p/mapivi/code" mapivi mapivi-svn.desktop mapivi.png)

pkgver() {
 cd "$srcdir/$pkgname"
 local ver="$(svnversion)"
 printf "r%s" "${ver//[[:alpha:]]}"
}


package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{share,bin}  
  mkdir -p $pkgdir/usr/share/{$pkgname,applications,pixmaps}
  mkdir -p $pkgdir/usr/share/$pkgname/{icons,PlugIns,docs,Tk}

  cp icons/* $pkgdir/usr/share/$pkgname/icons/
  cp PlugIns/*  $pkgdir/usr/share/$pkgname/PlugIns/ 
  cp Tk/*  $pkgdir/usr/share/$pkgname/Tk/ 
  cp docs/*  $pkgdir/usr/share/$pkgname/docs/ 
  cp mapivi.pl $pkgdir/usr/share/$pkgname/

  install -m755 $srcdir/mapivi $pkgdir/usr/bin/mapivi-svn
  install -m644 $srcdir/mapivi-svn.desktop $pkgdir/usr/share/applications/
  install -m655 $srcdir/mapivi.png $pkgdir/usr/share/pixmaps/mapivi-svn.png

  chmod 644 $pkgdir/usr/share/$pkgname/icons/*
}
md5sums=('SKIP'
         '838400c143467bd6767ddb68a204f484'
         '709b5c5ad79ad78918afb17214ed0044'
         '15d8e83af7ccfa852774a48d2fb1ba75')
