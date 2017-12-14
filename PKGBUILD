# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=lib32-fakechroot
_pkgname=fakechroot
pkgver=2.19
pkgrel=2
pkgdesc="Gives a fake chroot environment (32-bit)"
depends=(fakechroot lib32-glibc)
makedepends=(gcc-multilib)
arch=('x86_64')
url="https://github.com/dex4er/fakechroot/wiki"
license=('LGPL')
install=fakechroot.install
source=(${_pkgname}-$pkgver.tar.gz::https://github.com/dex4er/fakechroot/archive/${pkgver}.tar.gz)
md5sums=('db6378420c769232e69508bb78612c34')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export CFLAGS="$CFLAGS -m32"

  ./configure --prefix=/usr --libdir=/usr/lib32/libfakeroot
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -C src DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/etc/ld.so.conf.d/"
  echo '/usr/lib32/libfakeroot/fakechroot/' > "${pkgdir}/etc/ld.so.conf.d/lib32-fakechroot.conf"
}
