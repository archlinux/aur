# Contributor: tvoor <ftdabcde@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=png_sec
pkgver=0.1.1.8
pkgrel=3
pkgdesc="tool to encrypt text and hide it in .png file"
arch=('x86_64')
url="https://github.com/DOGINFOG/png_sec"
license=('GPL')
depends=('libgcrypt' 'libpng')
makedepends=('cmake' 'make' 'git')
provides=('png_sec-git')
conflicts=('png_sec-git')
source=("$pkgname::git+$url.git#tag=v$pkgver"
	"git+https://github.com/DOGINFOG/cmake_scripts.git")
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.cmake.url "$srcdir"/cmake_scripts
  git submodule update
  chmod u+x "$srcdir"/$pkgname/cmake/sha256parse.sh
}

build() {
  cd "$pkgname"
  cmake -Bbuild
  make -Cbuild
}

check() {
  cd "$pkgname"
  make -Cbuild test
}

package() {
  cd "$pkgname"
  make -Cbuild DESTDIR="$pkgdir" install
}
