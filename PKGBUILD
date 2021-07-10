# Maintainer: Max Pastushkov <max@pastushkov.com>
# Contributor: uffe _.at._ uffe _.dot._ org

pkgname=minipro-logictest-git
pkgver=0.5.r23.g68e8723
pkgrel=1
pkgdesc="Open source programming utility for autoelectric.cn Minipro TL866"
url="https://gitlab.com/DavidGriffith/minipro"
arch=("i686" "x86_64")
license=("GPL")
depends=("libusb" "srecord")
makedepends=("git")
source=($pkgname::git+https://gitlab.com/DavidGriffith/minipro.git#branch=logic-test)
conflicts=("minipro" "minipro-git")
provides=("minipro")
md5sums=("SKIP")

pkgver()
{
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build()
{
  cd "${srcdir}/${pkgname}"
  make PREFIX="/usr"
}

package()
{
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" COMPLETIONS_DIR="/usr/share/bash-completion/completions" install
}

# vim: ts=2 sw=2 et:
