# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ian Yang <doit.ian@gmail.com>

pkgname=google-glog-static
pkgver=0.3.5
pkgrel=1
pkgdesc="Logging library for C++"
arch=('x86_64')
license=('custom:BSD3')
url='https://github.com/google/glog'
depends=('gcc-libs')
options=('staticlibs')
source=("glog-$pkgver.tar.gz::https://github.com/google/glog/archive/v$pkgver.tar.gz")
provides=('google-glog')
conflicts=('google-glog')
sha512sums=('a54a3b8b4b7660d7558ba5168c659bc3c8323c30908a4f6a4bbc6f9cd899350f3243aabc720daebfdeb799b276b51ba1eaa1a0f83149c4e1a038d552ada1ed72')

build() {
  cd glog-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd glog-$pkgver

  make DESTDIR="$pkgdir" install

  # Lazy way of dealing with conflicting man and info pages...
  rm -rf "$pkgdir"/usr/share

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
