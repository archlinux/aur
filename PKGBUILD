# Maintainer: KUMAX <kumax2048@pm.me>

_pkgname=xcalibrate
pkgname=xcalibrate-git
pkgrel=1
pkgver=r29.c27c47e
pkgdesc="X.org touchscreen calibrator. An alternative to xinput_calibrator."
url="https://github.com/reinderien/xcalibrate"
depends=("python-numpy")
makedepends=("git")
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
