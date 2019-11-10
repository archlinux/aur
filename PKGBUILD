# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=libperflogger
pkgver=0.0.1
pkgrel=1
pkgdesc="A library and script for monitoring frametimes in OpenGL/Vulkan games for Linux."
arch=('any')
_vendor="github.com/Lurkki14/${pkgname}"
url="https://${_vendor}"
license=('GPL3')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://${_vendor}/archive/${pkgver}.tar.gz")
sha256sums=('b0ce5b0e89a00f73be5e0ccbd0f59b4ff681c49021afb07986dbdb5a1db72d19')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make
	install -DTm0644 libperflogger.conf $pkgdir/etc/ld.so.conf.d/libperflogger.conf
	install -DTm0755 perflogger.sh $pkgdir/usr/local/bin/perflogger
	install -DTm0755 libperflogger32.so $pkgdir/usr/local/lib/libperflogger/lib32/libperflogger.so
	install -DTm0755 libperflogger.so $pkgdir/usr/local/lib/libperflogger/lib64/libperflogger.so
}

post_install() {
	ldconfig
}

post_remove() {
  ldconfig
}
