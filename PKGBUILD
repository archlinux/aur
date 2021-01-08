# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.2.0
pkgrel=2
pkgdesc='PDF/DJVU/TXT viewer which behaves like vi'
arch=('x86_64')
url="http://naihe2010.github.com/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'djvulibre' 'webkit2gtk' 'ebook-tools')
makedepends=('cmake')
source=("$pkgname-$pkgver::http://github.com/naihe2010/apvlv/archive/v$pkgver.tar.gz")
sha256sums=('a4a2f42a7e42715a21d2356def3ed93c180c6ae41128580addee42835e5374c2')
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
