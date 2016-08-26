# Author and Maintainer: Samantha McVey <samantham@posteo.net>
# All files are licensed under the GPLv2.  Please see the included
# license for more details.

pkgname=('pacman-ps')
pkgver=0.1
pkgrel=1
arch=('any')
url='https://gitlab.com/samcv/ps-lsof'
license=('GPLv2')
depends=('lsof' 'procps-ng' 'bash' 'coreutils' 'findutils')
pkgdesc="Provides a command to identify which running processes have files that have changed on disk.  It also provides a pacman hook and pacman-ps to also show which packages own the files that are still open"
source=("pacman-ps.sh"
        "pacman-ps-post.hook"
        "ps-lsof.sh"
        "pacman-ps-posthook.sh")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  mkdir -p ${pkgdir}/etc/pacman.d/hooks
  cp ${srcdir}/pacman-ps-post.hook ${pkgdir}/etc/pacman.d/hooks

  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/pacman-ps.sh ${pkgdir}/usr/bin/pacman-ps
  chmod +x ${pkgdir}/usr/bin/pacman-ps

  cp ${srcdir}/ps-lsof.sh ${pkgdir}/usr/bin/ps-lsof
  chmod +x ${pkgdir}/usr/bin/ps-lsof

  cp ${srcdir}/pacman-ps-posthook.sh ${pkgdir}/usr/bin/pacman-ps-posthook
  chmod +x ${pkgdir}/usr/bin/pacman-ps-posthook
  install=pacman-ps.install
}
