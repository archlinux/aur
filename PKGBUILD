# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=fragrep
pkgver=2
pkgrel=1
pkgdesc="Detect nucleotide pattern fragments in genomes that occur in a given order"
arch=('x86_64' 'i686')
license=('GPL2')
url="https://www.bioinf.uni-leipzig.de/Software/fragrep/"
depends=()
optdepends=()
makedepends=()
provides=()
source=(http://www.bioinf.uni-leipzig.de/Software/fragrep/fragrep-${pkgver}.tar.gz
        buildfix.patch)
md5sums=( '1b33fdeb039a65f98c26bc738c81c14e'
          '0c5606ea4b4a0b79b1df729ed5a32840')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../buildfix.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make release || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install binaries
  install -Dm755 fragrep "${pkgdir}/usr/bin/fragrep"
  install -Dm755 pattern2eps "${pkgdir}/usr/bin/pattern2eps"
  install -Dm755 aln2pattern "${pkgdir}/usr/bin/aln2pattern"
  install -Dm755 alimatch "${pkgdir}/usr/bin/alimatch"
  install -Dm755 snglnaln "${pkgdir}/usr/bin/snglnaln"
  install -Dm755 fragexpand "${pkgdir}/usr/bin/fragexpand"
  install -Dm755 fasplit "${pkgdir}/usr/bin/fasplit"
  

  # install manpages
  for man in man/*.1
  do
    file=`basename $man`
    install -Dm644 ${man} "${pkgdir}/usr/share/man/man1/${file}"
  done

  # install documentation
  install -Dm644 doc/fragrep-tutorial.html "${pkgdir}/usr/share/doc/${pkgname}/fragrep-tutorial"
  install -Dm644 doc/fragrep.css "${pkgdir}/usr/share/doc/${pkgname}/fragrep.css"
  install -Dm644 doc/YRNA.aln "${pkgdir}/usr/share/doc/${pkgname}/YRNA.aln"
  install -Dm644 doc/X.fa "${pkgdir}/usr/share/doc/${pkgname}/X.fa"

}

