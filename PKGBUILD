# Author and Maintainer: Samantha McVey <samantham@posteo.net>
# Copyright (C) 2016
# This file and project are licensed under the GPLv2 or greater at your choice.
# For more information view the license included or visit:
# https://www.gnu.org/licenses/gpl-2.0.html

pkgname=('pacman-ps')
pkgver=0.2.0
pkgrel=1
arch=('any')
url='https://gitlab.com/samcv/ps-lsof'
license=('GPLv2')
depends=('lsof' 'procps-ng' 'bash' 'coreutils' 'findutils')
pkgdesc="Provides a command to identify which running processes have files that \
  have changed on disk.  It also provides a pacman hook and pacman-ps to also show \
  which packages own the files that are still open."

options=('!strip')
source=("pacman-ps.sh"
        "pacman-ps-post.hook"
        "ps-lsof.sh"
        "pacman-ps-posthook.sh"
        "pacman-ps.install"
        "license.txt"
        "pacman-ps.1")
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

package() {
  LICENSE_DIR="/usr/share/licenses"
  BIN_DIR="/usr/bin"
  HOOK_DIR="/etc/pacman.d/hooks"
  MAN_DIR="/usr/share/man/man1"

  install -D -m 644 ${srcdir}/pacman-ps-post.hook ${pkgdir}${HOOK_DIR}/pacman-ps-post.hook

  install -D -m 755 ${srcdir}/pacman-ps.sh ${pkgdir}${BIN_DIR}/pacman-ps

  install -D -m 755 ${srcdir}/ps-lsof.sh ${pkgdir}${BIN_DIR}/ps-lsof

  install -D -m 755 ${srcdir}/pacman-ps-posthook.sh ${pkgdir}${BIN_DIR}/pacman-ps-posthook

  install -D -m 644 ${srcdir}/license.txt ${pkgdir}${LICENSE_DIR}/${pkgname}/license.txt

  install -D -m 644 ${srcdir}/pacman-ps.1 ${pkgdir}${MAN_DIR}/pacman-ps.1

  install=pacman-ps.install
}
