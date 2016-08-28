# Author and Maintainer: Samantha McVey <samantham@posteo.net>
# All files are licensed under the GPLv2.  Please see the included
# license for more details.

pkgname=('pacman-ps')
pkgver=0.1.1
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
        "license.txt")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  LICENSE_DIR="/usr/share/licenses"
  BIN_DIR="/usr/bin"
  HOOK_DIR="/etc/pacman.d/hooks"

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

  install=pacman-ps.install
}
