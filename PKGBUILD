# Maintainer: M0Rf30

pkgname=r-studio
pkgver=3.7.1568
pkgrel=1
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
        
md5sums=('cd445fd706497dfc987c59f29d12a3ec'
         '023626f715a2581768dac0c6de07ebae'
         '21f1baf671cd9c49c740d92b506203f9')
[[ "$CARCH" == 'x86_64' ]] && md5sums[0]='7b8f37f4a62688a938c036eef974d568'

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

