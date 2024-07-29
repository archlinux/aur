# Maintainer: Ash <xash at riseup d0t net>
pkgname="mpv-quality-menu-git"
pkgver=r173.ab40a0d
pkgrel=4
pkgdesc="A userscript for MPV that allows you to change the streamed video and audio quality (ytdl-format) on the fly."
arch=('any')
url="https://github.com/christoph-heinrich/mpv-quality-menu"
license=('GPL2')
depends=('mpv')
makedepends=('git')
provides=('mpv-quality-menu')
conflicts=('mpv-quality-menu')
source=("git+https://github.com/christoph-heinrich/mpv-quality-menu.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/mpv-quality-menu"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mpv-quality-menu"
  
  install -Dm 644 "quality-menu.lua" "$pkgdir/etc/mpv/scripts/quality-menu.lua"
  install -Dm 644 "quality-menu.conf" "$pkgdir/etc/mpv/script-opts/quality-menu.conf"
  
  # Optional OSC extension
  install -Dm 644 "quality-menu-osc.lua" "$pkgdir/etc/mpv/scripts/quality-menu-osc.lua"
  
  # Install LICENSE
  install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
