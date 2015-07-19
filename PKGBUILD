# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: felixonmars
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgname=lib32-libva-vdpau-driver
pkgver=0.7.4
pkgrel=5
pkgdesc="VDPAU backend for VA API (32-bit)"
arch=('x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('GPL')
depends=('lib32-libva' 'lib32-libvdpau' 'lib32-libgl' 'libva-vdpau-driver')
makedepends=('gcc-multilib' 'gcc-libs-multilib' 'lib32-mesa')
source=("http://freedesktop.org/software/vaapi/releases/${pkgname#lib32-}/${pkgname#lib32-}-${pkgver}.tar.bz2"
        "libva-vdpau-driver-0.7.4-glext-missing-definition.patch"
        "libva-vdpau-driver-0.7.4-libvdpau-0.8.patch"
        "libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch")
sha512sums=('89f98dc1d7d590fb68f440dd1e37e025d64a621324e013e85dd1367681c07b09132fd2089539fc5b48934624648887a8a97539b4f07ddf9f56a8a456ad030094'
            '5be5b00e3bc6df790bf1f0cde9606053ef70ee3c36f97dd1ba2eaa38251ce86124586a34c5e3d7fc20c331f9894b23ec22e7ae9d007aa15940221f2547ee64ee'
            '0890112bed4013de70272972be14f608b22935938160f65a2165cca715c1e8ec7e8c92c5b5c66c655932d1adbaf0aad2f979f0d541890daee385e544a6890f82'
            'f60e84f88eca17e762e3d5a53404d0215bca27051c02ff3e4441ad2c2897c0c04297b8e7b4693c37404bde95d7b5d7a6392b4c17ab1ece5f1bd78e6af376b301')

prepare() {
  cd ${pkgname#lib32-}-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  patch -p1 -i ../libva-vdpau-driver-0.7.4-glext-missing-definition.patch
  patch -p1 -i ../libva-vdpau-driver-0.7.4-libvdpau-0.8.patch
  patch -p1 -i ../libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch
}

build() {
  cd ${pkgname#lib32-}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname#lib32-}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
