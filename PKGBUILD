# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Lubosz Sarnecki <lubosz0@gmail.com>
# Original Package: Martin Wimpress <code@flexion.org>
_pkgbase=nvidia-settings
pkgname=lib32-libxnvctrl
pkgver=465.31
pkgrel=1
pkgdesc='NVIDIA NV-CONTROL X extension (32-bit)'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-libxext')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/$pkgver.tar.gz"
        'libxnvctrl_so.patch')
sha512sums=('e178df78332e3c1051afc394ad0dc49ed572748ed739d1e21aab6c7e5b52c7470ba7ebe251780654509e46f05f6e86a1299c08ac1786958173ec449356106a92'
            '91ff94736063b911c83b8876fe3e3778db82e0ffe0102036d81a3a6e872ca44a585914646fcbbbe399cd63aa17685fc7f73263ec4f4084f48768ca4d704037fa')

prepare() {
  cd "$_pkgbase-$pkgver"
  patch -p0 < "$srcdir/libxnvctrl_so.patch"
}

build() {
  export PREFIX=/usr
  export OUTPUTDIR=out
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'
  cd "$_pkgbase-$pkgver"
  make -C src/libXNVCtrl
}

package() {
  cd "$_pkgbase-$pkgver"
  cd src/libXNVCtrl
  install -d "$pkgdir/usr/lib32"
  cp -Pr out/libXNVCtrl.* -t "$pkgdir/usr/lib32"
}
