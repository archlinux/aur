# Maintainer: Mauro Santos <registosites@hotmail.com>
# Contributer: AndyRTR <andyrtr@archlinux.org>

pkgname=hunspell-en-us
pkgver=2015.05.18
pkgrel=4
pkgdesc="English US hunspell dictionaries"
arch=(any)
url="http://wordlist.aspell.net/dicts/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell:	the spell checking libraries and apps')
source=(http://downloads.sourceforge.net/project/wordlist/speller/$pkgver/hunspell-en_US-$pkgver.zip)
sha1sums=('a4172755005d80cc4d89d919aed08fb998db7635')

prepare() {
  sed -i "s:SET UTF8:SET UTF-8:g"  *.aff
}

build() {
 /bin/true
}

package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 en_*.dic en_*.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  install -m644 README_en_*.txt $pkgdir/usr/share/doc/$pkgname

  # licenses
  install -D -m644 README_en_US.txt $pkgdir/usr/share/licenses/$pkgname/Copyright_en_US
}
