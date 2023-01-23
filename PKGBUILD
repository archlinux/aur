# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='mythes-pt_pt'
pkgver=20060817
pkgrel=4
pkgdesc="Portuguese (European) thesaurus"
arch=('any')
url="http://mirror.its.dal.ca/freebsd/distfiles/"
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=("http://mirror.its.dal.ca/freebsd/distfiles/thes_pt_PT_v2.zip")
sha256sums=('287e56dc278e49cbb60a08ee96330dc1a7e8945b1fab700408bcc700592e9903')

package() {
  cd $srcdir
  install -dm755 $pkgdir/usr/share/mythes
  install -m644 th_pt_PT_v2.* $pkgdir/usr/share/mythes

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/mythes/*; do
      ln -sv /usr/share/mythes/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_th_pt_PT_v2.txt $pkgdir/usr/share/doc/$pkgname
  
  # licences
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -m644 README_th_pt_PT_v2.txt $pkgdir/usr/share/licenses/$pkgname
}
