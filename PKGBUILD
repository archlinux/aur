# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-sound-theme-git
pkgver=r8.7aabe44
pkgrel=1
pkgdesc="System76 COSMIC Sound Theme"
arch=('any')
url="https://github.com/pop-os/cosmic-sound-theme"
license=('CC-BY-SA-4.0')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-sound-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
