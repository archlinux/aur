# Contributer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='hunspell-en-base'
pkgver=7.1
pkgrel=1
arch=('any')
#url="http://en-gb.pyxidium.co.uk/"
url="http://wordlist.sourceforge.net/"
license=('LGPL' 'custom:scowl')
pkgdesc="English hunspell dictionaries (base files)"
optdepends=('hunspell: the spell checking libraries and apps')
conflicts=('hunspell-en')
source=(http://downloads.sourceforge.net/wordlist/hunspell-en_US-$pkgver-0.zip
        http://en-gb.pyxidium.co.uk/dictionary/en_GB.zip)
md5sums=('8eb485db0a722eb29a5eca517a22e367'
         '218909136738f4564b81ecd145ade6ee')

build() {
 /bin/true
}

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/hunspell
  install -m644 en_*.dic en_*.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_en_??.txt $pkgdir/usr/share/doc/$pkgname

  # licenses
  install -dm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 README_en_??.txt $pkgdir/usr/share/licenses/$pkgname
}
