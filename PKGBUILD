# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>
# Contributor: pika02

pkgname=hibernator-git
_pkgname=hibernator
pkgver=r12.2912cbf
pkgrel=1

pkgdesc="Script to automate setting up hibernation"
arch=('any')
url="https://github.com/Chrysostomus/hibernator"
license=("MIT")

depends=(
  sed
  awk
  bash
  mkinitcpio
  update-grub
)
makedepends=(
  git
)

conflicts=($_pkgname)
provides=($_pkgname)

b2sums=('SKIP')

source=("${pkgname}::git+https://github.com/Chrysostomus/hibernator.git")

pkgver() {
  cd ${pkgname}

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package () {
  cd ${pkgname}

  install -Dm 755 hibernator "${pkgdir}/usr/bin/hibernator"
} 
