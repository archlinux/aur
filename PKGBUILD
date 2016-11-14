# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
_pkgname=joydevmap
pkgname=$_pkgname-git
pkgver=r5.0fa6015
pkgrel=1
pkgdesc="a small userspace tool to change the axis and button mappings of joysticks and gamepads in Linux"
arch=('i686' 'x86_64')
url="https://www.sthu.org/code/joydevmap.html"
license=('LGPL')
makedepends=('cmake')
depends=('glibc')
source=("git+https://git.sthu.org/repos/joydevmap.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  [[ -d "$srcdir/build" ]] && rm -r "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr "../$_pkgname"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir/" install
}
