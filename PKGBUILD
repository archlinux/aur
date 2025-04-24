# Maintainer: OGIOS <ogios@foxmail.com>
_pkgname=wayfreeze
pkgname=wayfreeze-git
pkgver=r65.8277f98
pkgrel=1
pkgdesc="Tool to freeze the screen of a Wayland compositor "
arch=('x86_64' 'aarch64')
url="https://github.com/Jappie3/wayfreeze"
license=('AGPL-3.0')
provides=(wayfreeze)
depends=('wayland' 'libxkbcommon')
makedepends=(cargo git)
options=(!debug)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
