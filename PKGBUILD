# Maintainer: M0Rf30

pkgname=r-studio
pkgver=4.7.1568
pkgrel=2
pkgdesc="Undelete and data recovery software"
arch=('i686' 'x86_64')
url="http://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('xdg-utils')
[[ "$CARCH" == 'x86_64' ]] && _arch=x64
[[ "$CARCH" == 'i686' ]] && _arch=i386
source=(http://www.r-tt.com/downloads/RStudio3_$_arch.deb
        $pkgname.desktop
        $pkgname.png)
        
md5sums=('8d3cc04d581d0a53210f6aa6e1c742cc'
         '023626f715a2581768dac0c6de07ebae'
         '21f1baf671cd9c49c740d92b506203f9')
[[ "$CARCH" == 'x86_64' ]] && md5sums[0]='678b3f7fc75a50e7e6c0515be71e1cde'

package() {
  cd $srcdir
  tar xvf data.tar.gz
  cp -r usr $pkgdir
  rm $pkgdir/usr/local/R-Studio/share/{logo*,*.desktop}	
  rm $pkgdir/usr/bin/rstudio
  ln -sr /usr/local/R-Studio/bin/R-Studio $pkgdir/usr/bin/R-Studio
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

