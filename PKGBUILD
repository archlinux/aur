# Maintainer: OGIOS <ogios@foxmail.com>
_pkgname=wayfreeze
pkgname=wayfreeze-git
pkgver=r63.dcbe269
pkgrel=1
pkgdesc="Tool to freeze the screen of a Wayland compositor "
arch=('x86_64' 'aarch64')
url="https://github.com/Jappie3/wayfreeze"
license=('MIT')

provides=(wayfreeze)
# conflicts=("$_pkgname"-bin)

depends=('wayland' 'libxkbcommon')
makedepends=(cargo git)

source=("git+$url.git")
options=(!debug)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #  printf "%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
