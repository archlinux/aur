# Maintainer: ananaso <adavidson+aur@protonmail.ch>
# Contributor: 4679kun <4679kun@outlook.com>

pkgname=gnome-shell-screenshotlocations-extension-git
pkgver=r31.dfdcf12
pkgrel=1
pkgdesc="A GNOME extension for changing the screenshot output directory"
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-screenshotlocations-extension"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git' 'meson' 'eslint')
source=('git+'${url}'.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    arch-meson --buildtype=plain build
    ninja -C build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" ninja -C build install
}
