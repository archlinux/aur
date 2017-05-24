# Maintainer: j605
_gitname=CasterSoundboard
pkgname=castersoundboard-git
pkgver=r97.851eccd
pkgrel=1
pkgdesc='A soundboard for hot-keying and playing back sounds. (For podcasting)'
arch=('x86_64' 'i686')
url="https://github.com/JupiterBroadcasting/CasterSoundboard"
license=('LGPL3')
depends=('qt5-multimedia')
makedepends=('git')
source=('git+https://github.com/JupiterBroadcasting/CasterSoundboard.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  [[ -d build ]] && rm -r build
  mkdir build && cd build

  qmake "../$_gitname/$_gitname" PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir/" install
}
