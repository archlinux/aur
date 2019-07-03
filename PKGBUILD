# Contributor: Samadi van Koten
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=chicken-git
pkgver=5.1.1.r5049.126a315f
pkgrel=1
pkgdesc='Feature rich R5RS Scheme compiler and interpreter'
arch=('x86_64')
url='http://call-cc.org/'
license=('custom:bsd')
depends=('chicken')
makedepends=('git')
conflicts=('chicken')
provides=('chicken')
source=('git://code.call-cc.org/chicken-core.git')
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd chicken-core
  echo "$(cat buildversion).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd chicken-core
  make PLATFORM=linux \
       CSC_PROGRAM=chicken-csc \
       CSI_PROGRAM=chicken-csi \
       PREFIX='/usr'
}

package() {
  cd chicken-core
  make PLATFORM=linux \
       DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       CSC_PROGRAM=chicken-csc \
       CSI_PROGRAM=chicken-csi install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rmdir "$pkgdir"/usr/share/chicken/doc/manual
}
