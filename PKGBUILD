# Maintainer: Huy Hoang <boydaihungst @gmail.com>
# Contributor: Huy Hoang <boydaihungst @gmail.com>
# Contributor: thoughtsunificator <hidden>
# Contributor: George-1717 <hidden>
# Contributor: kotauskas <hidden>
# Contributor: Guekka <hidden>
# Contributor: exquo <hidden>
# Contributor: poperigby <hidden>
# Original author: GermainZ <hidden>
# Keywords: portal xdg-desktop-portal terminal

pkgname=xdg-desktop-portal-termfilechooser-boydaihungst-git
pkgver=r65.7e8de01
pkgrel=1
pkgdesc='xdg-desktop-portal backend for your favorite terminal file chooser (boydaihungst fork)'
url="https://github.com/boydaihungst/xdg-desktop-portal-termfilechooser"
arch=('x86_64')
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=('xdg-desktop-portal' 'libinih')
makedepends=('meson' 'scdoc' 'git')
optdepends=(
  'fzf: wrapper included'
  'kitty: default terminal for launching wrappers'
  'lf: wrapper included'
  'nnn: wrapper included'
  'ranger: wrapper included'
  'vifm: wrapper included'
  'yazi: wrapper included'
)
source=(
  "${pkgname}::git+$url.git"
)
sha512sums=('SKIP')
conflicts=(xdg-desktop-portal-termfilechooser-git xdg-desktop-portal-termfilechooser-hunkyburrito-git xdg-desktop-portal-termfilechooser-nosystemd-git)

pkgver() {
  cd "${pkgname}"
  (
    set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname}"
  arch-meson -Dsd-bus-provider=libsystemd build
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
