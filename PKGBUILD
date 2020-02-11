# Maintainer: Alexey Andreyev <aa13q@ya.ru>

pkgname=android-unpackbootimg
_srcname=android-unpackbootimg
pkgver=r9.b92cac0
pkgrel=1
pkgdesc="Tools to work with Android boot images"
arch=('armv7h' 'i686' 'x86_64' 'aarch64')
url="https://github.com/anestisb/android-unpackbootimg"
license=('Apache')
makedepends=('make')
optdepends=('python')
conflicts=()
source=(
  "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')
options=(!makeflags)

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/mkbootimg"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/mkbootimg.py"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/unpackbootimg"
}
