# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=mpv-autosub-git
_pkgname=${pkgname%-git}
pkgver=r52.3511535
pkgrel=1
pkgdesc="Fully automatic subtitle downloading for the MPV media player"
arch=(any)
url="https://github.com/davidde/mpv-autosub"
license=("MIT")
depends=("mpv")
makedepends=("git")
provides=("mpv-autosub")
source=("$_pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  sed -i 's/\/home\/david\/.local/\/usr/g' autosub.lua
}

package() {
  cd "$_pkgname"
  install -Dm644 autosub.lua \
    -t "$pkgdir"/usr/share/mpv/scripts
}
