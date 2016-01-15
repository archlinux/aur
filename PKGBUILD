# Maintainer: Reuben <projectdelphai at gmail dot com>
# Contributor: Chad Aeschliman <chadaeschliman at gmail dot com>
# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Stefan Husmann <stefan-husmann@t-oline.de> 

pkgname=recode-pybliographer
pkgver=3.7
pkgrel=1
url="http://directory.fsf.org/recode.html"
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Converts files between various character sets and usages patched with pybliographer patch"
depends=('glibc')
conflicts=('recode')
provides=('recode')
source=("https://codeload.github.com/pinard/Recode/legacy.tar.gz/2fd8385658e5a08700e3b916053f6680ff85fdbd")
md5sums=('c37bec32cd432289ed76a84a97abc3e3')

build() {
  cd $srcdir/pinard-Recode-2fd8385

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd $srcdir/pinard-Recode-2fd8385
  make prefix=$pkgdir/usr infodir=$pkgdir/usr/share/info install
  find $pkgdir -name '*.la' -exec rm {} \;
  rm $pkgdir/usr/share/info/dir
  for _i in  $pkgdir/usr/share/info/recode.info*
  do
    gzip ${_i}
  done
}
