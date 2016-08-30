# Author and Maintainer: Samantha McVey <samantham@posteo.net>
# Copyright (C) 2016
# This file and project are licensed under the GPLv2 or greater at your choice.
# For more information view the license included or visit:
# https://www.gnu.org/licenses/gpl-2.0.html

pkgname=('pacman-ps')
pkgver=0.1.2
pkgrel=1
arch=('any')
url='https://gitlab.com/samcv/ps-lsof'
license=('GPLv2')
depends=('lsof' 'procps-ng' 'bash' 'coreutils' 'findutils')
pkgdesc="Provides a command to identify which running processes have files that have changed on disk.  It also provides a pacman hook and pacman-ps to also show which packages own the files that are still open"
options=('!strip')
source=("pacman-ps.sh"
        "pacman-ps-post.hook"
        "ps-lsof.sh"
        "pacman-ps-posthook.sh"
        "pacman-ps.install"
        "license.txt"
        "pacman-ps.1")
sha1sums=('9d48ae474feeed2bf16079f3f6b713af21feffc3'
          '28be8f69c8b349a43d90de416b9d6cd8282b37af'
          'c99b016b99bb52f5f17a427a0f191e8e7fefec33'
          '13403de1fc04e8642e167ddd87b567401b48b099'
          '49f62584fc204f91fa96e72a7ff21b5fa338e472'
          '4cc77b90af91e615a64ae04893fdffa7939db84c'
          'd32f392fc69fbc264525923e50bd4b0243bae869')

package() {
  LICENSE_DIR="/usr/share/licenses"
  BIN_DIR="/usr/bin"
  HOOK_DIR="/etc/pacman.d/hooks"
  MAN_DIR="/usr/share/man/man1"

  mkdir -p ${pkgdir}${HOOK_DIR}
  cp ${srcdir}/pacman-ps-post.hook ${pkgdir}${HOOK_DIR}

  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/pacman-ps.sh ${pkgdir}${BIN_DIR}/pacman-ps
  chmod +x ${pkgdir}${BIN_DIR}/pacman-ps

  cp ${srcdir}/ps-lsof.sh ${pkgdir}${BIN_DIR}/ps-lsof
  chmod +x ${pkgdir}${BIN_DIR}/ps-lsof

  cp ${srcdir}/pacman-ps-posthook.sh ${pkgdir}${BIN_DIR}/pacman-ps-posthook
  chmod +x ${pkgdir}${BIN_DIR}/pacman-ps-posthook

  mkdir -p ${pkgdir}${LICENSE_DIR}/pacman-ps
  cp ${srcdir}/license.txt ${pkgdir}${LICENSE_DIR}/${pkgname}

  mkdir -p ${pkgdir}${MAN_DIR}
  cp ${srcdir}/pacman-ps.1 ${pkgdir}${MAN_DIR}

  install=pacman-ps.install
}
