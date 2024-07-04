# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Francis Carroll (franciscarroll at gmail dot com)

pkgname=splix
pkgver=2.0.1
pkgrel=1
pkgdesc="CUPS drivers for SPL (Samsung Printer Language) printers"
arch=('x86_64')
url="https://openprinting.github.io/splix/"
license=('GPL-2.0-only')
depends=('libcups' 'gcc-libs' 'ghostscript' 'jbigkit')
makedepends=('krb5')
install=splix.install
source=(https://github.com/OpenPrinting/splix/releases/download/$pkgver/$pkgname-$pkgver.tar.xz
        splix-deviceID.patch
        splix-ldflags.patch)
sha256sums=('533946d57897bf62a2cf8f74e488258e11fa0c55028fad43ada24c5686f38a06'
            '83bdee7236d577bee20d2ba38e1586e17702001c0c7e665cf54d7f0f156e50c3'
            'e262082f1eeb3b2c637c0fd85e17ce3e3455c66730ba78417114ff74d0d78704')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../splix-deviceID.patch
  patch -Np1 -i ../splix-ldflags.patch
}

build() {
  cd $pkgname-$pkgver
  CXXFLAGS+=' -fno-strict-aliasing'
  make drv
  make all DRV_ONLY=1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install DRV_ONLY=1
}

# vim:set ts=2 sw=2 et:
