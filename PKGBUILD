# Maintainer: Pablo Lezaeta Reyes (JotaRandom) <prflr88@gmail.com>
# Contributor: ark Wagie (yochananmarqos) <mark.wagie@proton.me>

pkgname=xapp-symbolic-icons
pkgver=r8.ab8fefc
pkgrel=3
pkgdesc="A set of symbolic icons for GTK applications and projects"
arch=('any')
url="https://github.com/xapp-project/xapp-symbolic-icons"
license=('GPL-3.0-only AND LGPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
)
makedepends=(
  'git'
  'meson'
)
_commit=ab8fefc49ee34b5de583ae615bafa48670f0d231
source=("git+https://github.com/xapp-project/xapp-symbolic-icons.git#commit=${_commit}")
sha256sums=('57e59f6ae9004136b11a5ff0714b1fe0e31371a756ebd5919dc2a17183576aa3')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

