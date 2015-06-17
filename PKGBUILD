# Maintainer: M0Rf30 <morf3089@gmail.com>

pkgname=vhdl-simili
pkgver=3.1b16
pkgrel=3
pkgdesc="A low-cost VHDL development system designed for the serious hardware designer." 
arch=('i686' 'x86_64') 
url="http://www.symphonyeda.com/products.htm" 
license=('custom') 
install=$pkgname.install
source=(http://www.symphonyeda.com/Downloads/Simili31b16-linux-x86.tar
	vhdl-simili.sh
	vhdl-simili.csh) 
depends=('glibc' 'libx11')

if [[ "$CARCH" == 'x86_64' ]]; then
	depends=('lib32-'{'glibc','libx11'})
fi

package()
{
   idir=opt/simili
   cd $srcdir
   tar xvf Simili*.tar
   mkdir -p $pkgdir/opt/simili  
   cd $pkgdir/opt/simili 
   tar xvf $srcdir/Simili*.tgz
   cd $pkgdir
   cp "$idir/bin/freelic.txt" "$idir/bin/symphony.lic"
   ls -l "$idir"/doc/index.htm "$idir"/doc/*.pdf

   install -m755 -d "${pkgdir}/etc/profile.d"
   install -m755 "${srcdir}/"$pkgname.{sh,csh} "${pkgdir}/etc/profile.d/"
}


md5sums=('b92b4bf72a55845576359f05d8465f12'
         '2520169313fca8024d970a2c1fb6d2ab'
         '569609c49efe253d201f71b1c88c3740')
