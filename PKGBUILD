# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

_basever=2.2.12

pkgname=gapc-fold-grammars-git
pkgver="${_basever}.841.cac090a"
pkgrel=1
pkgdesc="Bielefeld RNA secondary structure prediction programs."
url="https://bibiserv.cebitec.uni-bielefeld.de/fold-grammars/"
license=("GPL3")
arch=(i686 x86_64 arm armv6h armv7h aarch64)
depends=('gapc>=2020')
makedepends=('git')
provides=(pKiss=2.2.13
          pAliKiss=1.0.8
          RNAshapes=3.3.1
          RNAalishapes=2.4.8
          RapidShapes=18.11.2020
          Knotinframe=20.03.2015)
source=("git+https://github.com/jlab/fold-grammars.git")
sha256sums=("SKIP")

pkgver() {
    cd fold-grammars
    printf "${_basever}.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd fold-grammars

    for application in \
        pKiss \
        pAliKiss \
        RNAshapes \
        RNAalishapes \
        RapidShapes \
        Knotinframe
    do
      cd Misc/Applications/$application
      make all
      cd ../../..
    done
}

package() {
    cd fold-grammars

    for application in \
        pKiss \
        pAliKiss \
        RNAshapes \
        RNAalishapes \
        RapidShapes \
        Knotinframe
    do
        cd Misc/Applications/$application
        make install PREFIX="${pkgdir}/usr" INSTALLDIR=/usr
        cd ../../..
    done
}
