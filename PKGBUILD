# Maintainer: Stefan Seemayer <stefan.seemayer@mpibpc.mpg.de>
# Author: Andy Hauser <hauser@genzentrum.lmu.de>

pkgname=hhsuite
pkgver=3.0.beta.2
pkgrel=1
pkgdesc="A set of programs for protein sequence homology detection by iterative HMM-HMM comparison for computational biology like PSI-BLAST"
arch=('i686' 'x86_64')
url="https://github.com/soedinglab/hh-suite"
license=(GPL)

source=("https://github.com/soedinglab/hh-suite/releases/download/v3.0-beta.2/hhsuite-3.0-beta.2-Source.tar.gz"
        "hhsuite.sh")

sha1sums=('f5cdc06a4753ad3150504edab9ea32969d40f226'
          '92f7e9e78b7b65d5eaf8aaa438d0877b9f6bb5f0')

build() {
  cd ${srcdir}/hhsuite-3.0.1-Source
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
  make
}

package() {
  cd ${srcdir}/hhsuite-3.0.1-Source
  make install INSTALL_DIR="${pkgdir}/usr"

  mkdir -p ${pkgdir}/usr/share/hhsuite

  install -Dm644 hhsuite-userguide.pdf ${pkgdir}/usr/share/hhsuite/

  mv ${pkgdir}/usr/lib{64,}
  mv ${pkgdir}/usr/scripts ${pkgdir}/usr/share/hhsuite/
  mv ${pkgdir}/usr/data ${pkgdir}/usr/share/hhsuite/
  install -Dm755 "$srcdir/hhsuite.sh" "${pkgdir}/etc/profile.d/hhsuite.sh"
}

# vim:set ts=2 sw=2 et:
