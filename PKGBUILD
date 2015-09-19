# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=kinwalker
pkgver=2.0
pkgrel=1
pkgdesc="Compute cotranscriptional folding trajectories of RNAs"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.bioinf.uni-leipzig.de/Software/Kinwalker/"
depends=('viennarna')
optdepends=()
makedepends=()
provides=()
source=(http://www.bioinf.uni-leipzig.de/Software/Kinwalker/kinwalker.tar.gz
        0001-corrected-Makefile-in-order-to-work-with-ViennaRNA-2.patch
        0002-remove-redefinition-of-INF-energies.patch
        0003-remove-unnecessary-and-deprecated-wrong-declarations.patch
        0004-make-kinwalker-comply-to-stricter-g.patch
        0005-remove-all-the-remaining-unnecessary-stuff.patch
        0006-fix-bug-for-co-transcriptional-folding-with-dangles-.patch
        0007-Do-not-fail-on-using-B-heuristic.patch
        0008-Removed-findpath.h-and-cleaned-up-remnants-of-false-.patch
)
md5sums=( '7723b173de294ef96b86d94f4f6cbeb9'
          '2f92e91e58badff10d4fe697bca3abf0'
          'dba93e6fce292b6e9b9e7e0b667e6e6c'
          '9ae628a2c89ac2654813b87a54605966'
          '73489a3b0f68a5bbfd158b5ea06f422a'
          '39bd8b46857edd134671c30260dcc93c'
          'a6bab92d415092d4e47e08564ae9c48e'
          '285cfd82e05b9e0c69d0196089d82e3b'
          '4afda6634ea89393975b953ca7788497'
          )

prepare() {
  cd "${srcdir}/kinwalker"

  patch -p1 < ../0001-corrected-Makefile-in-order-to-work-with-ViennaRNA-2.patch
  patch -p1 < ../0002-remove-redefinition-of-INF-energies.patch
  patch -p1 < ../0003-remove-unnecessary-and-deprecated-wrong-declarations.patch
  patch -p1 < ../0004-make-kinwalker-comply-to-stricter-g.patch
  patch -p1 < ../0005-remove-all-the-remaining-unnecessary-stuff.patch
  patch -p1 < ../0006-fix-bug-for-co-transcriptional-folding-with-dangles-.patch
  patch -p1 < ../0007-Do-not-fail-on-using-B-heuristic.patch
  patch -p1 < ../0008-Removed-findpath.h-and-cleaned-up-remnants-of-false-.patch
}

build() {
  cd "${srcdir}/kinwalker"
  make || return 1
}

package() {
  cd "${srcdir}/kinwalker"

  install -Dm755 kinwalker "${pkgdir}/usr/bin/kinwalker"
  install -Dm644 man/kinwalker.1 "${pkgdir}/usr/share/man/man1/kinwalker.1"
}

