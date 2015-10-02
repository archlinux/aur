# Contributor: Archie <xMickael@ifrance.com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mapivi
pkgver=097
pkgrel=1
pkgdesc="A photo management tool with focus on JPEG pictures. Mapivi supports adding, editing and searching of IPTC/IIM, EXIF data and JPEG comments. The pictures are managed in place (in your folder structure)."
depends=('jpegpixi' 'jhead' 'imagemagick' 'libjpeg' 'perl-image-info' 'perl-image-metadata-jpeg' 'tk-matchentry' 'tk-resizebutton' 'tk-splash' 'perl-tk' 'perl-exiftool')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname$pkgver.tar.gz mapivi mapivi.desktop mapivi.png 07_usrShareMapivi.diff 08_removeMousePod.diff 09_qw_parentheses.diff)
url="http://mapivi.sourceforge.net/mapivi.shtml"
md5sums=('f1432cbb0033c1a1a324651dbc0700b2'
         '85f09ddc913d654ea92fa987838bcc63'
         '5e34164357ee0351d68fd4ca048d99ac'
         '15d8e83af7ccfa852774a48d2fb1ba75'
         '59e1b327f32eea54e28463295f67496b'
         '001918d8da9a54446df603e2c2804592'
         '18937b9307fab48277499b76952439d0')

package() {
  cd $srcdir/$pkgname$pkgver
  mkdir -p $pkgdir/usr/{share,bin}  
  mkdir -p $pkgdir/usr/share/{$pkgname,applications,pixmaps}
  mkdir -p $pkgdir/usr/share/$pkgname/{html,icons,pics,PlugIns}

  # applying a few patches from debian 
  for file in $srcdir/*diff
	do
	patch -p0 < "$file"
	done

  cp pics/*  $pkgdir/usr/share/$pkgname/pics/
  cp html/*  $pkgdir/usr/share/$pkgname/html/
  cp icons/* $pkgdir/usr/share/$pkgname/icons/
  cp PlugIns/*  $pkgdir/usr/share/$pkgname/PlugIns/ 
  cp {COPYING,FAQ,INSTALL,mapivi,README,Changes.txt,License.txt,Tips.txt} $pkgdir/usr/share/$pkgname/

  install -m755 $srcdir/mapivi $pkgdir/usr/bin/mapivi
  install -m644 $srcdir/mapivi.desktop $pkgdir/usr/share/applications/
  install -m655 $srcdir/mapivi.png $pkgdir/usr/share/pixmaps/

  chmod 644 $pkgdir/usr/share/mapivi/icons/*
}
