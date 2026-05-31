# Maintainer: Izu <ccatdev@proton.me>

pkgname=linux-devmgmt
pkgver=2.0
pkgrel=1
pkgdesc="A faithful recreation of the Windows Device Manager"
arch=(x86_64)
url="https://github.com/actuallyaridan/$pkgname"
license=(GPL-3.0-only)
depends=(glibc libgcc libstdc++ qt6-base)
makedepends=(cmake)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
)
sha256sums=('77c6517769a100de2f9fa54f005379a2cf5db966135507e29e6b77edb569e0a6'
            'a1dc439ef9ea952fca24bf46abc603ce34dfe13af32d673c55d473cfc07d7a19')

build() {
  cd $pkgname-$pkgver

  cmake -B build \
    -DCMAKE_BUILD_TYPE='None'

  cmake --build build
}

package() {
  cd $pkgname-$pkgver

  install -vDm 755 "build/devmgmt" -t "$pkgdir/usr/bin"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -vDm 644 "$srcdir/linux-devmgmt.desktop" -t "$pkgdir/usr/share/applications"
}
