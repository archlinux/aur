# Maintainer: zHappySnake <ashley@nullworks.dev>

pkgname=we-linux-git
_pkgname=we-linux
pkgver=r8.60cbbb2
pkgrel=1
pkgdesc="Run the Steam copy of Wallpaper Engine as your KDE Plasma wallpaper, with its original UI"
arch=('x86_64')
url="https://github.com/zHappySnake/we-linux"
license=('GPL-3.0-or-later')
depends=('bash' 'glibc' 'kconfig' 'kwin' 'procps-ng' 'steam' 'systemd' 'systemd-libs' 'xorg-xprop' 'xorg-xwininfo')
makedepends=('git' 'mingw-w64-gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
