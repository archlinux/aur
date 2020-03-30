# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=gapc-fold-grammars-git
pkgver=r1.0.3.be95625
pkgrel=2
pkgdesc="Bielefeld RNA secondary structure prediction programs."
url="https://bibiserv.cebitec.uni-bielefeld.de/fold-grammars/"
license=("GPL3")
arch=(i686 x86_64 arm armv6h armv7h aarch64)
depends=('gapc')
makedepends=('git')
provides=(pKiss=2.2.12
          pAliKiss=1.0.7
          RNAshapes=3.3.0
          RNAalishapes=2.4.7)
source=("git+https://github.com/RaumZeit/fold_grammars.git")
sha256sums=("SKIP")

pkgver() {
    cd fold_grammars
    printf "r1.0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd fold_grammars

    for application in \
        pKiss \
        pAliKiss \
        RNAshapes \
        RNAalishapes
    do
      cd Misc/Applications/$application
      make all
      cd ../../..
    done
}

package() {
    cd fold_grammars

    for application in \
        pKiss \
        pAliKiss \
        RNAshapes \
        RNAalishapes
    do
        cd Misc/Applications/$application
        make install PREFIX="${pkgdir}/usr" INSTALLDIR=/usr
        cd ../../..
    done
}
