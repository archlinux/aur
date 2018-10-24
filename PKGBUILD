# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.1.5.28
pkgrel=1
pkgdesc='PDF/DJVU/TXT viewer which behaves like vi'
arch=('x86_64')
url="http://naihe2010.github.com/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'djvulibre')
makedepends=('cmake' 'git')
source=(git+https://github.com/naihe2010/apvlv.git#commit=10d7611bd8634fb72d4934086294d4056c2081d7)
sha256sums=('SKIP')
backup=('etc/apvlvrc')

build() {
  cd $pkgname
  [[ -d build ]] || mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPVLV_WITH_DJVU=yes -DAPVLV_WITH_TXT=yes \
        -DAPVLV_WITH_UMD=no  ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
