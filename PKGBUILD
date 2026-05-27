# Maintainer: chaozhi_l <chaozhi_l@foxmail.com>
# Contributor: yetist <yetist@gmail.com>; zlsun <zlsun1995@gmail.com>

pkgname=lunar-date
pkgver=3.2.0
pkgrel=1
pkgdesc="Chinese lunar date library."
arch=("i686" "x86_64")
url="https://github.com/yetist/lunar-date"
license=('LGPL-2.1-only')
depends=('glib2' 'glibc' 'gcc-libs')
makedepends=('ninja' 'meson' 'gobject-introspection' 'vala' 'glib2-devel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yetist/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('ce35f70b2e4ca0f80052bbd0f9af622c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson build --prefix /usr -Ddocs=true -Dintrospection=true -Dvapi=true -Dtests=true
  ninja -C build/
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  DESTDIR="${pkgdir}" ninja install
}
