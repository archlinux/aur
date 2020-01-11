# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=easyabc
pkgver=1.3.7.7
pkgrel=1
pkgdesc="graphical music notation editor for the ABC music notation language"
arch=('i686' 'x86_64' 'ppc')
url="http://sourceforge.net/projects/easyabc/"
license=('GPL')
depends=('python-wxpython' 'python-pyparsing' 'python-pygame' 'abcmidi' 'abcm2ps' 'ghostscript')
makedepends=('gendesk')
source=(http://downloads.sourceforge.net/project/easyabc/EasyABC/${pkgver}/${pkgname}_source_code_${pkgver}.zip)
sha256sums=('98e775cc196254cdd7f4c07c0426ba713b159b48e8628b52345480d84301d928')

prepare(){
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name='EasyABC' \
    --mimetype='text/vnd.abc' \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package(){
  mkdir -p "$pkgdir"/usr/share
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/opt

  cp -dpr --no-preserve=ownership "${pkgname}_source_code_${pkgver}" $pkgdir/opt/easyabc
  echo -e '#!/bin/bash\npython /opt/easyabc/easy_abc.py "$@"' > $pkgdir/usr/bin/easyabc
  chmod +x $pkgdir/usr/bin/easyabc
  install -Dm644 "${pkgname}_source_code_${pkgver}/img/logo64.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  ln -s /usr/bin/abc2abc $pkgdir/opt/easyabc/bin/
  ln -s /usr/bin/abc2midi $pkgdir/opt/easyabc/bin/
  ln -s /usr/bin/abcm2ps $pkgdir/opt/easyabc/bin/
}
