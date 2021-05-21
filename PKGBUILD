# Maintainer: Ondrej Kipila <ok100.ok100.ok100@gmail.com>

pkgname=hunspell-cs
pkgver=20210301
pkgrel=1
pkgdesc="Czech dictionary for Hunspell"
arch=('any')
url="http://www.translatoblog.cz/hunspell/"
license=('GPL2' 'custom')
depends=('hunspell')
source=(http://www.translatoblog.cz/wp-content/uploads/2021/03/hunspell_cs.zip )
md5sums=('e65ea8e0180ace22e7a633d91275c167')


package() 
{
  install -dm755 "$pkgdir"/usr/share/hunspell
  install -m644 cs_CZ.aff "$pkgdir"/usr/share/hunspell
  install -m644 cs_CZ.dic "$pkgdir"/usr/share/hunspell

  # the symlinks
  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
  for file in "$pkgdir"/usr/share/hunspell/*; do
    ln -sv /usr/share/hunspell/$(basename $file) .
  done
  popd

  # docs
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname
  install -m644 readme.txt "$pkgdir"/usr/share/doc/$pkgname

}
