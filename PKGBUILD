# Maintainer: Max Resch <resch.max@gmail.com>
pkgname=ox
pkgver=G1.04
pkgrel=2
pkgdesc="An Attribute Grammar Compiling System based on Yacc, Lex, and COx"
url="http://www.complang.tuwien.ac.at/ubvl/tools/ox/"
arch=('x86_64' 'i686')
license=('OX')
depends=('flex' 'bison')
source=('http://www.complang.tuwien.ac.at/ubvl/tools/ox/oxDistG1.04.sh.Z'
        'http://www.complang.tuwien.ac.at/ubvl/tools/ox/ox-flex-new-gcc4.patch')
md5sums=('c5817fa2033cdf16fd8b554fbf227461'
         '83420f31399244f7ba4e07f1aee670d5')
options=(!makeflags)

build() {
  cd "${srcdir}"
  uncompress -c oxDistG1.04.sh.Z > oxDistG1.04.sh
  chmod u+x oxDistG1.04.sh
  rm -rf "oxDistG1.04"
  ./oxDistG1.04.sh
  cd "oxDistG1.04"
  patch -p1 -i "${srcdir}/ox-flex-new-gcc4.patch"
  cd "source"
  make
}

package() {
  cd "${srcdir}/oxDistG1.04"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm755 "source/ox" "$pkgdir/usr/bin/ox"
  install -Dm644 "docs/ox.1" "$pkgdir/usr/share/man/man1/ox.1"
}
