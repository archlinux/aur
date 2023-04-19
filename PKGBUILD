# Mantainer: ObserverOfTime <chronobserver@disroot.org>
# based on lib32-numactl

_basename=numactl
pkgname=lib32-libnuma
pkgver=2.0.16
pkgrel=1
pkgdesc='Simple NUMA policy support 32-bit version. Libraries only'
arch=('x86_64')
url='https://github.com/numactl/numactl'
license=('LGPL2.1' 'GPL2')
depends=('perl' 'numactl' 'lib32-gcc-libs')
conflicts=('lib32-numactl')
provides=("lib32-numactl=${pkgver}")
source=("$_basename-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a35c3bdb3efab5c65927e0de5703227760b1101f5e27ab741d8f32b3d5f0a44c')

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
  rm -rf "${pkgdir}"/usr/{share,bin,include}
}
