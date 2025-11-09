# Maintainer: Pablo Lezaeta Reyes (JotaRandom) <prflr88@gmail.com>
# Contributor: ark Wagie (yochananmarqos) <mark.wagie@proton.me>

pkgname=xapp-symbolic-icons-git
pkgver=r8.ab8fefc
pkgrel=3
pkgdesc="A set of symbolic icons for GTK applications and projects (git)"
arch=('any')
url="https://github.com/xapp-project/xapp-symbolic-icons"
license=('GPL-3.0-only' 'LGPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
)
makedepends=(
  'git'
  'meson'
)
provides=('xapp-symbolic-icons')
conflicts=('xapp-symbolic-icons')
source=("${pkgname}::git+https://github.com/xapp-project/xapp-symbolic-icons.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

