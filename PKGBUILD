# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer:  Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.1.5
pkgrel=5
pkgdesc='PDF/DJVU/TXT viewer which behaves like Vim'
arch=('x86_64')
url="http://naihe2010.github.com/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'djvulibre')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/naihe2010/apvlv/archive/v$pkgver.tar.gz
        gcc6.patch
        gcc7.patch)
backup=('etc/apvlvrc')
md5sums=('e200e1f8ad7e765399d08845d6de2c9b'
         'a0cb038ddb3c3e0c8a0e991f1deb2ad3'
         'dd9713d10716c43dab7722d8b6107ea8')

prepare() {
  cd $pkgname-$pkgver

  # Fix build
  patch -Np1 -i ../gcc6.patch
  patch -Np1 -i ../gcc7.patch
}

build() {
  cd $pkgname-$pkgver

  mkdir -p build
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
