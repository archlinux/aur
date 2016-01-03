# Maintainer: Will Price <will.price94+aur@gmail.com>

pkgname=mediafire-fuse-git
pkgver=0.90.r19.g95951eb
pkgrel=1
pkgdesc="MediaFire shell and fuse driver"
arch=('i686' 'x86_64' 'armv6' 'armv7')
url="https://github.com/MediaFire/mediafire-fuse"
license=('GPL2')
groups=()
depends=('fuse' 'jansson' 'curl')
makedepends=('git')
provides=('mediafire-shell' 'mediafire-fuse')
conflicts=()
replaces=()
backup=()
options=()
source=('git+https://github.com/MediaFire/mediafire-fuse.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd "$srcdir/${pkgname%%-git}"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib"

  make
}

package() {
  cd "$srcdir/${pkgname%%-git}/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
