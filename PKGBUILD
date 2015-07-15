# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='mythes-pt_pt'
pkgver=20060817
pkgrel=3
pkgdesc="Portuguese (European) thesaurus"
arch=('any')
url="http://download.services.openoffice.org/contrib/dictionaries/"
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=("http://download.services.openoffice.org/contrib/dictionaries/thes_pt_PT_v2.zip")
md5sums=('2fa9a6845405ebb574c2f82a5cddbcbf')
PKGEXT='.pkg.tar'

build() {
  /bin/true
}

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
