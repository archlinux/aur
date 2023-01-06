# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Lubosz Sarnecki <lubosz0@gmail.com>
# Original Package: Martin Wimpress <code@flexion.org>
_pkgbase=nvidia-settings
pkgname=lib32-libxnvctrl
pkgver=525.78.01
pkgrel=1
pkgdesc='NVIDIA NV-CONTROL X extension (32-bit)'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-libxext')
optdepends=('libxnvctrl: XNVCtrl development headers')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/$pkgver.tar.gz"
        'libxnvctrl_so.patch')
sha512sums=('1ade323bd2b14eeaea174d8f1a0d166c66b99f1e3c679ba1e617278254a164ca544a85bea989a684ea51e7be878ea241aeac21af3bc7948018a6dcde9f39002b'
            '8b07853f253e881d5c121c666674961d1be7f99a25deba7e521bed3ce5fa00c564d99d5b7364c0eb3afe5b64040a86a4040a99505795bfc13e70f5fa7de482af')

prepare() {
  cd "$_pkgbase-$pkgver"
  patch -p0 < "$srcdir/libxnvctrl_so.patch"
}

build() {
  cd "$_pkgbase-$pkgver"
  make CC='gcc -m32' PREFIX=/usr OUTPUTDIR=out -C src/libXNVCtrl
}

package() {
  cd "$_pkgbase-$pkgver"
  install -d "$pkgdir/usr/lib32"
  cp -Pr src/libXNVCtrl/out/libXNVCtrl.* -t "$pkgdir/usr/lib32"
}
