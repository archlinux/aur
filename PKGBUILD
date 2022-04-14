# Maintainer: 3llena-arch <3llena-arch@protonmail.com>

pkgname=cxx-run
pkgver=2022.04.14.added.install
pkgrel=1
pkgdesc="simple, clean and customisable run dialog in sfml"
arch=('x86_64')
makedepends=('git' 'gcc' 'make' 'sfml')
url="https://github.com/0x7fff-git/cxx-run"
license=('GPL')
source=(git+https://github.com/0x7fff-git/cxx-run)
sha256sums=('SKIP')
provides=('cxx-run')
conflicts=('cxx-run')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format=format:'%as-%f' | tr - .
}

build() {
  cd ${pkgname%-git}
  
  g++ main.cxx -w -lsfml-graphics -lsfml-system -lsfml-window -std=c++20 -Wl,--as-needed -Ofast -march=native -flto -o cxx-run -DNDEBUG -mtune=native -s --fast-math -fpermissive
  strip --strip-unneeded -R .comment cxx-run
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing executables...'
  install -Dm 755 cxx-run -t "$pkgdir"/usr/bin

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  
  msg2 'Config avatar path ==> $HOME/.config/cxx-run.conf'
}
