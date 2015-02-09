# Maintainer: queue <queueRAM@gmail.com>

pkgname=minipro-git
pkgver=0.0.1.r0.g60dda45
pkgrel=1
pkgdesc="Open source programming utility for autoelectric.cn Minipro TL866"
url="https://github.com/vdudouyt/minipro"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
source=(${pkgname}::git://github.com/vdudouyt/minipro.git)
conflicts=('minipro')
provides=('minipro')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}

# vim: ts=2 sw=2 et:
