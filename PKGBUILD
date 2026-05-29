# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=mythes-ar
pkgver=3.5
pkgrel=1
_name=dictionaries
pkgdesc="Arabic thesaurus"
arch=('any')
url="http://ayaspell.sourceforge.net"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MPL-1.1')
makedepends=('libmythes')
optdepends=('libmythes: offers thesaurus library functions')
source=("http://downloads.sourceforge.net/project/ayaspell/dict_ar-3.5.2014-11-08.oxt")
sha256sums=('1f273bbf44ff627bdc7e4fe9239649cdf48e672b94c34ce5b791bbf069d2f05e')

build() {
  th_gen_idx.pl > "$srcdir"/th_ar.idx < "$srcdir"/th_ar.dat
}

package() {
  install -vDm 644 "$srcdir"/th_ar.dat "$pkgdir/usr/share/mythes/th_ar_v2.dat"
  install -vDm 644 "$srcdir"/th_ar.idx "$pkgdir/usr/share/mythes/th_ar_v2.idx"
  install -vdm 755 "$pkgdir/usr/share/myspell/dicts/"

  for file in "$pkgdir/usr/share/mythes/"*; do
    ln -sv "/usr/share/mythes/$(basename $file)" "$pkgdir/usr/share/myspell/dicts/$(basename $file)"
  done

  # docs
  install -vDm 644 "$srcdir"/docs/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
