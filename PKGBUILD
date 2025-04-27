# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='hyphen-pt_pt'
pkgver=20040415
pkgrel=4
pkgdesc="Portuguese hyphenation rules"
arch=('any')
url="https://wiki.documentfoundation.org/Development/Dictionaries"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=('https://cgit.freedesktop.org/libreoffice/dictionaries/plain/pt_PT/hyph_pt_PT.dic'
        'https://cgit.freedesktop.org/libreoffice/dictionaries/plain/pt_PT/README_hyph_pt_PT.txt')
sha256sums=('6f18ee89de6db21d9b06120a5527ec41d8132514fc112ccfe7d289ba91649840'
            '62f19b9d8b42f2b0ff165ab434f40cfb4210a464f0662c31f6f99d77d0306e06')

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/hyphen
  install -m644 hyph_pt_PT.dic $pkgdir/usr/share/hyphen

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_hyph_pt_PT.txt $pkgdir/usr/share/doc/$pkgname
  
  # licences
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -m644 README_hyph_pt_PT.txt $pkgdir/usr/share/licenses/$pkgname
}
