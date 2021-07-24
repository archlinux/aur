# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.3.0
pkgrel=1
pkgdesc='PDF/DJVU/TXT viewer which behaves like vi'
arch=('x86_64')
url="https://github.com/naihe2010/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'webkit2gtk' 'ebook-tools')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0ccab3cdc8848fefd490e4c0e8e89739511a1e1874ea0313346813626b9e9fc0')
backup=('etc/apvlvrc')

build() {
  cd $pkgname-$pkgver
  [[ -d build ]] || mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPVLV_WITH_DJVU=no -DAPVLV_WITH_TXT=yes ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
