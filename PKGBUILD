# Maintainer: Ryushe <jaadynhumpries at gmail dot com>
pkgname=hyprswap-git
pkgver=0
pkgrel=1 # update when add dependencies (increment ++)
pkgdesc="Monitor 'swapper' for Hyprland utilizing hyprsome's workspaces"
arch=('x86_64')
url="https://github.com/Ryushe/hyprswap"
license=("MIT")
depends=('hyprsome-git')
makedepends=('git' 'rust')
optdepends=() # optional dependencies
provides=('package')
conflicts=('hyprswap' 'hyprswap-bin')
# install=proto.install # find in /usr/share/pacman/proto.install (hooks for installer)
source=("hyprswap-git::git+https://github.com/Ryushe/hyprswap.git#branch=main")
sha256sums=('SKIP')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
}

# package() {
#   cd "${pkgname%-git}"
#   chmod +x hyprswap.sh
#   install -Dm755 hyprswap.sh "$pkgdir/usr/bin/hyprswap"
#   install -d "$pkgdir/usr/lib/$pkgname"
#   cp -a . "$pkgdir/usr/lib/$pkgname"
# }

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/share/${pkgname}"
  cp -a . "$pkgdir/usr/share/${pkgname}"
  chmod +x "$pkgdir/usr/share/${pkgname}/hyprswap.sh"
  install -Dm755 "$pkgdir/usr/share/${pkgname}/hyprswap.sh" "$pkgdir/usr/bin/hyprswap"
  install -Dm644 "$pkgdir/usr/share/${pkgname}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
