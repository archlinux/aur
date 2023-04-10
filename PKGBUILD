# Maintainer: Ryan Farley <ryan.farley@gmx.com>
pkgname=shoebill
pkgver=0.0.5
pkgrel=3
pkgdesc="A Macintosh II emulator that runs A/UX"
arch=('i686' 'x86_64')
url="https://github.com/pruten/$pkgname"
license=('BSD')
depends=('sdl2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pruten/shoebill/archive/$pkgver.tar.gz"
	"no_sys_errlist.patch")
md5sums=('03d24eeee574c06f9baa8c7c921d4682'
         'd8dcf81ea5eb69fc2678cd39294c45ec')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input "${srcdir}/no_sys_errlist.patch"
}

build() {
  cd "$pkgname-$pkgver/sdl-gui"
  ./lin_build.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dt "$pkgdir/usr/bin" sdl-gui/shoebill
}

#vim: set ts=2 sw=2 et:
