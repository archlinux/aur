# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=tok-git
pkgver=r193.0ade57f
pkgrel=1
pkgdesc="Telegram client built using Kirigami"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/network/tok"
license=('GPL3')
depends=('kirigami2' 'knotifications' 'libtd-git' 'ki18n' 'icu' 'rlottie-git' 'kconfigwidgets' 'kitemmodels')
makedepends=('git' 'qt5-tools' 'qt5-svg' 'qbs' 'jq')
provides=('tok')
conflicts=('tok')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  qbs build --no-install qbs.installPrefix:/usr
}

package() {
  cd "${pkgname%-git}"
  qbs install --no-build --install-root "${pkgdir}"
}
