# Maintainer: tarball <bootctl@gmail.com>

pkgname=spigot-calc
pkgver=20240202
_commit=10bd0ca
pkgrel=1
pkgdesc='a command-line exact real calculator'
arch=(i686 x86_64 aarch64)
url='https://www.chiark.greenend.org.uk/~sgtatham/spigot'
license=(MIT)
provides=(spigot)
conflicts=(spigot)
depends=(glibc gmp ncurses gcc-libs halibut)
makedepends=(cmake)
source=(
  "$pkgname-$pkgver.tar.gz::$url/spigot-$pkgver.$_commit.tar.gz"
  spigot.bash
)
sha256sums=('5bccbeaa48968e79e97af032a13fa5643d34f5142014f710d0c198e5088affe7'
            '6b1c50b816fdec961142e3a8fedffe160248bda463092708e812459909715781')

build() {
  cmake -B build -S "spigot-$pkgver.$_commit" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm755 "spigot-$pkgver.$_commit/LICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

  install -Dm644 spigot.bash \
    "$pkgdir/usr/share/bash-completion/completions/spigot"
}
