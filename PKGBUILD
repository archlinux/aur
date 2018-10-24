# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv-git
pkgver=0.1.5.29.g41f68a9
pkgrel=1
pkgdesc='PDF/DJVU/TXT viewer which behaves like vi'
arch=('x86_64')
url="http://naihe2010.github.com/apvlv/"
license=('GPL2')
depends=('gtk3' 'poppler-glib' 'djvulibre')
makedepends=('git' 'cmake')
conflicts=('apvlv')
provids=('apvlv')
source=(git+https://github.com/naihe2010/apvlv.git)
backup=('etc/apvlvrc')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf %s "$(git describe --tags|tr - .|cut -c2-)"
}

build() {
  cd ${pkgname%-git}

  [[ -d build ]] || mkdir -p build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPVLV_WITH_DJVU=yes -DAPVLV_WITH_TXT=yes \
        -DAPVLV_WITH_UMD=no ..

  make
}

package() {
  cd ${pkgname%-git}/build

  make DESTDIR="$pkgdir" install
}
