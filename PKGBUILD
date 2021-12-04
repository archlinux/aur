# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.4.0
pkgrel=2
pkgdesc='PDF/DJVU/TXT viewer which behaves like vi'
arch=('x86_64')
url="https://github.com/naihe2010/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'djvulibre' 'webkit2gtk' 'ebook-tools')
makedepends=('cmake' 'ghostscript')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e33e5914a0969e98d3fb08d88f4c83efc63143dcb472ec610b0bc110e096536f')
backup=('etc/apvlvrc')

build() {
  cd $pkgname-$pkgver
  [[ -d build ]] || mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPVLV_WITH_DJVU=yes -DAPVLV_WITH_TXT=yes ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
