# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=mauikit-imagetools-git
pkgver=r6.6073ba0
pkgrel=1
pkgdesc="MauiKit Image Tools Components"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-imagetools"
license=('GPL3')
depends=('mauikit-git' 'ki18n' 'kconfig' 'kcoreaddons' 'exiv2' 'kquickimageeditor-git')
makedepends=('git' 'extra-cmake-modules')
provides=('mauikit-imagetools')
conflicts=('mauikit-imagetools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
