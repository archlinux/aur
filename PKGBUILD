# Maintainer: Stefan Seemayer <stefan.seemayer@mpibpc.mpg.de>
# Author: Andy Hauser <hauser@genzentrum.lmu.de>

pkgname=hhsuite
pkgver=3.2.0
pkgrel=1
pkgdesc="A set of programs for protein sequence homology detection by iterative HMM-HMM comparison for computational biology like PSI-BLAST"
arch=('i686' 'x86_64')
url="https://github.com/soedinglab/hh-suite"
license=(GPL)

source=("https://github.com/soedinglab/hh-suite/archive/v${pkgver}.tar.gz"
        "hhsuite.sh")

sha256sums=('6b870dcfbc1ffb9dd664a45415fcd13cf5970f49d1c7b824160c260fa138e6d6'
            '89c6bbb4835cad792a27319ce1d05598a98585ec0d6b7d872a92daa34df40483')


build() {
  cd ${srcdir}/hh-suite-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
  make
}

package() {
  cd ${srcdir}/hh-suite-${pkgver}
  make install INSTALL_DIR="${pkgdir}/usr"

  mkdir -p ${pkgdir}/usr/share/hhsuite

  mv ${pkgdir}/usr/scripts ${pkgdir}/usr/share/hhsuite/
  mv ${pkgdir}/usr/data ${pkgdir}/usr/share/hhsuite/
  install -Dm755 "$srcdir/hhsuite.sh" "${pkgdir}/etc/profile.d/hhsuite.sh"
}

# vim:set ts=2 sw=2 et:
