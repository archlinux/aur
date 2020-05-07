# Maintainer: telans <telans@protonmail.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=virglrenderer-git
pkgver=0.8.2.r74.g71e0626
pkgrel=1
pkgdesc='The virgil3d rendering library is a library used by qemu to implement 3D GPU support for the virtio GPU'
arch=('i686' 'x86_64')
license=('MIT')
url='https://virgil3d.github.io/'
depends=('libepoxy' 'mesa')
makedepends=('python2' 'git')
provides=('virglrenderer')
conflicts=('virglrenderer')
source=('git://anongit.freedesktop.org/git/virglrenderer')
sha256sums=('SKIP')

pkgver() {
  cd virglrenderer
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/irglrenderer.//g'
}

build() {
  cd virglrenderer
  ./autogen.sh --prefix=/usr/ --enable-autotools

  make
}

package() {
  cd virglrenderer
  make DESTDIR="$pkgdir" install
}
