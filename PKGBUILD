# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-icon-theme-git
pkgver=3.5.1.r0.g1a575a8
pkgrel=1
epoch=1
pkgdesc="System76 Pop icon theme"
arch=('any')
url="https://github.com/pop-os/icon-theme"
license=('CC-BY-SA-4.0 AND CC-BY-NC-SA-4.0')
depends=('adwaita-icon-theme')
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/pop-os/icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd icon-theme
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson icon-theme build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd icon-theme
  install -Dm644 COPYING LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
