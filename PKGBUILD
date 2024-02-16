# Maintainer: killab33z <killab33z @ protonmail-dot-com>
# Previous Mantainer: ObserverOfTime <chronobserver@disroot.org>
# based on lib32-numactl
_basename=numactl
pkgname=lib32-libnuma
pkgver=2.0.18
pkgrel=1
pkgdesc='Simple NUMA policy support 32-bit version. Libraries only'
arch=('x86_64')
url='https://github.com/numactl/numactl'
license=('LGPL2.1' 'GPL2')
depends=('perl' 'numactl' 'lib32-gcc-libs')
conflicts=('lib32-numactl')
provides=("lib32-numactl=${pkgver}")
source=("$_basename-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8cd6c13f3096e9c2293c1d732f56e2aa37a7ada1a98deed3fac7bd6da1aaaaf6')

prepare() {
  cd "${_basename}-${pkgver}"
  export CC='gcc -m32' CXX='g++ -m32' \
         PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --host=i686-unknown-linux-gnu
}

build() {
  cd "${_basename}-${pkgver}"
  make
}

package() {
  cd "${_basename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir:?}"/usr/{share,bin,include}
}
