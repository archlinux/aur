# Maintainer: Robin Martijn <ik@robinmartijn.nl>

_pkgname=i3lock-fancier-rapid
pkgname=$_pkgname
pkgver=r16.56f7f0a
pkgrel=1
pkgdesc="A cleaner implementation of i3lock-fancy-rapid"
arch=('x86_64')
url="https://github.com/Bowero/$_pkgname"
license=('BSD')
depends=('i3lock' 'libx11')
makedepends=('libx11')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}