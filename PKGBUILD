# Maintainer: Devin Pohl <pohl.devin@gmail.com>

_pkgname=dmenu
pkgname=$_pkgname-rs
pkgver=5.0.0.5.ga9c84a1
pkgrel=1
pkgdesc="A 1:1 port of dmenu, rewritten in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Shizcow/dmenu-rs"
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('rust' 'git' 'clang')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/-/./g'
}

build() (
    cd dmenu-rs
    make
)

package() (
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
)