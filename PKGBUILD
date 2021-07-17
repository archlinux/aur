# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.2.1
pkgrel=1
pkgdesc='PDF/DJVU/TXT viewer which behaves like vi'
arch=('x86_64')
url="https://naihe2010.github.com/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'djvulibre' 'webkit2gtk' 'ebook-tools')
makedepends=('cmake')
source=("$pkgname-$pkgver::https://github.com/naihe2010/apvlv/archive/v$pkgver.tar.gz")
sha256sums=('ea1e4f4d76c52ee702b7c41f1c766f65d392a80982ffc7b906b928cb2b2bc829')
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
