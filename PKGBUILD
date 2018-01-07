# Maintainer: Stefan Seemayer <stefan.seemayer@mpibpc.mpg.de>
# Author: Andy Hauser <hauser@genzentrum.lmu.de>

pkgname=hhsuite
pkgver=3.0.beta.3
pkgrel=1
pkgdesc="A set of programs for protein sequence homology detection by iterative HMM-HMM comparison for computational biology like PSI-BLAST"
arch=('i686' 'x86_64')
url="https://github.com/soedinglab/hh-suite"
license=(GPL)

source=("https://github.com/soedinglab/hh-suite/releases/download/v3.0-beta.3/hhsuite-3.0-beta.3-Source.tar.gz"
        "hhsuite.sh")

sha256sums=('4213f21cc52d45308c1dffbac6f3247da4aa6d44a0675f94b71a300210dc3796'
            '89c6bbb4835cad792a27319ce1d05598a98585ec0d6b7d872a92daa34df40483')

build() {
  cd ${srcdir}/hhsuite-3.0-beta.3-Source
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
  make
}

package() {
  cd ${srcdir}/hhsuite-3.0-beta.3-Source
  make install INSTALL_DIR="${pkgdir}/usr"

  mkdir -p ${pkgdir}/usr/share/hhsuite

  install -Dm644 hhsuite-userguide.pdf ${pkgdir}/usr/share/hhsuite/

  mv ${pkgdir}/usr/lib{64,}
  mv ${pkgdir}/usr/scripts ${pkgdir}/usr/share/hhsuite/
  mv ${pkgdir}/usr/data ${pkgdir}/usr/share/hhsuite/
  install -Dm755 "$srcdir/hhsuite.sh" "${pkgdir}/etc/profile.d/hhsuite.sh"
}

# vim:set ts=2 sw=2 et:
