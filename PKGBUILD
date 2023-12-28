# Maintainer: Thermoflux <thermoflux at github dot com>
pkgname=curseofwar-sdl
pkgver=v1.3.0.2.g6292ca8  # Replace with the actual version
pkgrel=1
pkgdesc="A fast-paced action strategy game with SDL support"
arch=('x86_64')
url="https://a-nikolaev.github.io/curseofwar/"
license=('GPL3')
depends=('sdl2')  # This might be sdl or sdl2, check the specific dependency
makedepends=('git')
source=("git+https://github.com/a-nikolaev/curseofwar.git")  # The Git repository
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/curseofwar"
    git describe --tags | sed 's/-/./g'
}

build() {
  echo "Building at location $srcdir"
  # Dont comment pkgver here, as it also changes directory to source dir
  pkgver 
  make SDL=yes  # This is based on the provided build instructions
}

package() {
  cd "$srcdir/curseofwar"
  echo "Installing at location: $pkgdir/usr/bin/curseofwar-sdl"
  make SDL=yes DESTDIR=$pkgdir install
}
