# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=mpv-assrt-git
_pkgname=${pkgname%-git}
pkgver=r22.e12edf5
pkgrel=2
pkgdesc="Automatically download subtitles from assrt.net for mpv player."
arch=(any)
url="https://github.com/AssrtOSS/mpv-assrt"
license=("unknown")
depends=("mpv")
provides=("mpv-assrt")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -Dm644 scripts/modules/*.lua \
    -t "$pkgdir"/usr/share/mpv/scripts/modules
  install -Dm644 scripts/assrt.lua \
    -t "$pkgdir"/usr/share/mpv/scripts

  install -Dm644 script-opts/assrt.conf.example \
    "$pkgdir"/usr/share/doc/mpv/script-opts/assrt.conf
}
