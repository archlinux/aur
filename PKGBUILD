# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-sound-theme-git
pkgver=1.4.0.r0.g7aabe44
pkgrel=2
pkgdesc="System76 COSMIC Sound Theme"
arch=('any')
url="https://github.com/pop-os/cosmic-sound-theme"
license=('CC-BY-SA-4.0')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}" 'pop-sound-theme')
conflicts=("${pkgname%-git}" 'pop-sound-theme')
source=('git+https://github.com/pop-os/cosmic-sound-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
