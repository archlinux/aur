# Maintainer: Ondrej Kipila <ok100.ok100.ok100@gmail.com>

pkgname=hunspell-cs
pkgver=20061030
pkgrel=2
pkgdesc="Czech dictionary for Hunspell"
arch=('any')
url="http://extensions.services.openoffice.org/en/project/czech-dictionary-pack-ceske-slovniky-cs-cz"
license=('GPL2' 'custom')
depends=('hunspell')
source=(http://download.services.openoffice.org/contrib/dictionaries/cs_CZ-pack.zip )
md5sums=('a778a2a0df6abf505fd8b20a503414e0')


package() 
{
  bsdtar -xf cs_CZ.zip
  
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
  install -m644 README_cs.txt "$pkgdir"/usr/share/doc/$pkgname

}
