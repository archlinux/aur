# Maintainer: Scipio <archscipio@gmail.com>
# Contributor: Morgan Howe <mthowe@gmail.com>
# Contributor: Marc Rozanc <marc@rozanc.fr>

pkgname=ltl2ba
pkgver=1.3
pkgrel=1
pkgdesc="Fast translation from LTL formulas to Buchi automata."
url="http://www.lsv.ens-cachan.fr/~gastin/ltl2ba/"
arch=('x86_64' 'i686')
license=('GPL2')
source=("http://www.lsv.ens-cachan.fr/~gastin/ltl2ba/${pkgname}-${pkgver}.tar.gz")
md5sums=(SKIP)
depends=('glibc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
  iconv -f latin1 -t utf8 README > README.utf8
  mv README.utf8 README
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "ltl2ba" "$pkgdir/usr/bin/ltl2ba"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./ltl2ba -f "true"
}

# vim:set ts=2 sw=2 et:
