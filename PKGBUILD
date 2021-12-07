# Maintainer: chaozhi_l <chaozhi_l@foxmail.com>
# Contributor: yetist <yetist@gmail.com>; zlsun <zlsun1995@gmail.com>

pkgname=lunar-date
pkgver=3.0.0
pkgrel=2
pkgdesc="Chinese lunar date library."
arch=("i686" "x86_64")
url="https://github.com/yetist/lunar-date"
license=('GPL2')
depends=('glib2')
makedepends=('ninja' 'meson' 'gobject-introspection' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yetist/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('60153b57db5a012804a69e580c4af9e6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson build --prefix /usr -Denable_gtk_doc=true -Dwith_introspection=true -Dwith_vala=true -Denable_tests=true
    ninja -C build/
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" ninja install
}
