# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=easyabc
pkgver=1.3.6.4.4
pkgrel=2
pkgdesc="A graphical music notation editor for the ABC music notation language"
arch=('i686' 'x86_64' 'ppc')
url="http://sourceforge.net/projects/easyabc/"
license=('GPL')
depends=('wxpython2.8' 'python2-pyparsing' 'python2-pygame' 'abcmidi' 'abcm2ps' 'ghostscript')
makedepends=('gendesk')
source=('http://downloads.sourceforge.net/project/easyabc/EasyABC/1.3.6.4/easyabc_source_code_1.3.6.4.4.zip')
sha256sums=('5b3160bcd6d35b763d75d08170ff4a695428b67416a52f307f28571057d97b46')

prepare(){
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name='EasyABC' \
    --mimetype='text/vnd.abc' \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package(){
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/usr/bin
  cp -R $srcdir/easyabc_source_code_1.3.6.4.4 $pkgdir/usr/share/easyabc
  echo -e '#!/bin/bash\npython2 /usr/share/easyabc/easy_abc.py "$@"' >$pkgdir/usr/bin/easyabc
  chmod +x $pkgdir/usr/bin/easyabc
  install -Dm644 "$srcdir/easyabc_source_code_1.3.6.4.4/img/logo64.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  ln -s /usr/bin/abc2abc $pkgdir/usr/share/easyabc/bin/
  ln -s /usr/bin/abc2midi $pkgdir/usr/share/easyabc/bin/
  ln -s /usr/bin/abcm2ps $pkgdir/usr/share/easyabc/bin/
}
