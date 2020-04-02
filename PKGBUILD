pkgname=libmicrodns-git
_pkgname=libmicrodns
pkgver=0.1.2
pkgrel=1
pkgdesc='Minimal mDNS resolver library'
url='https://github.com/videolabs/libmicrodns'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc')
provides=('libmicrodns.so' 'libmicrodns')
conflicts=('libmicrodns')
source=("git+https://github.com/videolabs/libmicrodns.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
