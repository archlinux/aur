# $Id$

pkgname=mythes-ru
pkgver=0.1
pkgrel=2
pkgdesc="Russian thesaurus"
arch=(any)
url="http://wiki.services.openoffice.org/wiki/Dictionaries"
license=('LGPL')
optdepends=('libmythes: offers thesaurus library functions')
#source=(http://mirror.yandex.ru/openoffice/dict/thes_ru_RU_v2.zip)
source=(http://pkgs.fedoraproject.org/repo/pkgs/mythes-ru/thes_ru_RU_v2.zip/802cc8a3e5447a65debdbad13247f5c4/thes_ru_RU_v2.zip)
sha256sums=('58f7f86d63b9f4052c90f4964a37b608b4defabf0723902fa9b6f007a35fbdd4')

package() {

  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/mythes
  # cp -p th_ru_RU_v2.* $pkgdir/usr/share/mythes
  install -m 644 th_ru_RU_v2.* $pkgdir/usr/share/mythes

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/mythes/*; do
      ln -sv /usr/share/mythes/$(basename $file) .
    done
  popd

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  install -m 644 README_thes_ru_RU.txt $pkgdir/usr/share/doc/$pkgname
  install -m 644 licence.txt $pkgdir/usr/share/doc/$pkgname
}