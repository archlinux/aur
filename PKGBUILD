pkgname=lush-shell
pkgver=0.4.0
pkgrel=7
pkgdesc="Lunar shell is a Linux shell powered by Lua."
arch=('x86_64')
url="https://github.com/BanceDev/lush"
license=('BSD-3-Clause')
depends=('lua')
makedepends=('make' 'gcc' 'premake')
source=("git+https://github.com/BanceDev/lush.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=lush-shell.install

prepare() {
  cd "$srcdir/lush"
  git submodule update --init --recursive
}
build() {
  cd "$srcdir/lush"
  premake5 gmake
  make
}

package() {
  cd "$srcdir/lush"

  # install binary
  install -Dm755 bin/Debug/lush/lush "$pkgdir/usr/bin/lush"

}

