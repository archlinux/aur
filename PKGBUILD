# Maintainer: voxan <voxan [at the] hessfr [dot] fr>

pkgname=lib32-kmod
pkgver=34.2
pkgrel=1
pkgdesc="Linux kernel module handling"
arch=('x86_64')
url="http://git.kernel.org/?p=utils/kernel/kmod/kmod.git;a=summary"
license=('GPL2')
depends=('lib32-zlib' 'lib32-xz')
makedepends=('gcc-multilib' 'scdoc')
options=('!libtool')
validpgpkeys=('EAB33C9690013C733916AC839BA2A5A630CBEA53')  # Lucas DeMarchi
source=("https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-$pkgver.tar."{xz,sign})
md5sums=('36f2cc483745e81ede3406fa55e1065a'
         'SKIP')

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/kmod-${pkgver}"

  ./configure \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --disable-tools \
    --with-zlib \
    --with-xz

  make
}

package() {
  cd "${srcdir}/kmod-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # nuke manpages and headers
  rm -rf "${pkgdir}"/usr/{share,include,bin}
}


