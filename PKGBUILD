#
# PKGBUILD for minipro (unstable)
#
# Maintainer: uffe _.at._ uffe _.dot._ org
#

pkgname=minipro-git
pkgver=0.7.4.r1.gabb7d48
pkgrel=1

pkg_name_ver="${pkgname}-${pkgver}"
pkgdesc="Open source chip programming utility for autoelectric.cn MiniPro TL866xx series (TL866CS, TL866A, and TL866II+)"

url="https://gitlab.com/DavidGriffith/minipro"
arch=("i686" "x86_64")
license=("GPL-3.0-only")
makedepends=("git")
depends=("libusb" "libb64")
optdepends=("srecord: Motorola srecord format")
source=(${pkgname}::git+https://gitlab.com/DavidGriffith/minipro.git)
conflicts=("minipro")
provides=("minipro")
sha256sums=('SKIP')

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
  # temporary fix - use clang (19.1.7) as it is less picky compared to gcc (15.1.1)
  #make PREFIX="/usr" CC=clang CXX=clang++
  make PREFIX="/usr"
}

package()
{
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" COMPLETIONS_DIR="/usr/share/bash-completion/completions" install
}

# vim: ts=2 sw=2 et:
#
# EOF
#
