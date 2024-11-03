# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=hyprland-plugin-hyprscroller-git
pkgver=r133.d3b4ac0
pkgrel=1
pkgdesc='Hyprland layout plugin providing a scrolling layout like PaperWM and Niri.'
arch=('x86_64')
license=('MIT')
depends=('hyprland')
makedepends=('git' 'cmake')
url='https://github.com/dawsers/hyprscroller'
source=("${pkgname}::git+${url}")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  make all
}

package() {
  cd "$pkgname"
  install -Dm644 -t "$pkgdir/usr/lib/hyprland-plugins/" "hyprscroller.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
