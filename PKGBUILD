# Maintainer: Munzir Taha <munzirtaha at gmail dot com>
pkgname=hunspell-ar
pkgver=3.2
pkgrel=3
pkgdesc="Arabic dictionary for hunspell"
arch=(any)
url="http://ayaspell.sourceforge.net"
license=('GPL' 'LGPL' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/project/ayaspell/${pkgname}_${pkgver}.zip)
sha256sums=('cd4d48f13d5b68dc6e94e215d99cb214777eb20459f4be9f0caa3e40340736f5')

build() {
 /bin/true
}

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/hunspell
  install -D -m644 ar.dic ar.aff $pkgdir/usr/share/hunspell/

  pushd $pkgdir/usr/share/hunspell/
  ar_aliases="ar_AE  ar_BH  ar_DZ  ar_EG  ar_IN  ar_IQ  ar_JO  ar_KW  ar_LB ar_LY  ar_MA ar_OM  ar_QA  ar_SA  ar_SD  ar_SY  ar_TN  ar_YE"
  for lang in $ar_aliases; do
    ln -s ar.aff $lang.aff
    ln -s ar.dic $lang.dic
  done
  popd

  # the symlinks
  install -d $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
  for file in $pkgdir/usr/share/hunspell/ar.*; do
    ln -sv /usr/share/hunspell/$(basename $file) .
  done
  popd

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 ChangeLog-?? README-?? AUTHORS TODO-?? "$pkgdir/usr/share/doc/$pkgname/"
}
