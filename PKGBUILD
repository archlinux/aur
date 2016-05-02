# Maintainer: aksr <aksr at t-com dot me>
pkgname=right-window-git
pkgver=r11.5416887
pkgrel=1
epoch=
pkgdesc="Utility to move the focus between windows following cardinal directions"
arch=('i686' 'x86_64')
url="https://github.com/ntrrgc/right-window"
license=('MIT')
groups=()
depends=('')
makedepends=('git' 'cmake')
optdepends=()
checkdepends=()
provides=()
conflicts=('right-window')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/ntrrgc/right-window")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
  cd ..
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

