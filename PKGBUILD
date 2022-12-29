# Maintainer: griffin <griffin dot z dot s at outlook dot com>

_pkgname=skyemu
pkgname=$_pkgname-git
pkgver=r489.99f6cee
pkgrel=1
pkgdesc='Game Boy, Game Boy Color, and Game Boy Advanced Emulator.'
arch=('x86_64')
url='http://skyemu.app/'
license=('MIT')
depends=('libglvnd' 'libxi' 'alsa-lib' 'libxcursor')
makedepends=('git')
provides=('skyemu')
conflicts=('skyemu')
source=("$_pkgname::git+https://github.com/skylersaleh/SkyEmu.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  cmake .. 
  cmake --build . 
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm 755 "${srcdir}"/$_pkgname/build/bin/SkyEmu -t "${pkgdir}"/usr/bin/

  install -Dm644 "${srcdir}/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/skyemu-git/LICENSE"
  install -Dm644 "${srcdir}/$_pkgname/README.md" "$pkgdir/usr/share/doc/skyemu-git/README"
}
