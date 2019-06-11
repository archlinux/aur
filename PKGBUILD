# Maintainer: lod <aur@cyber-anlage.de>
pkgname=libnss-extrausers
pkgver=0.6
pkgrel=4
pkgdesc="nss module to have an additional passwd, shadow and group file"
arch=('any')
url="https://packages.debian.org/de/source/sid/libnss-extrausers"
license=('GPL')
makedepends=('gcc')
conflicts=('libnss-extrausers-git')
source=(http://http.debian.net/debian/pool/main/libn/$pkgname/${pkgname}_$pkgver.orig.tar.gz
        http://deb.debian.org/debian/pool/main/libn/$pkgname/${pkgname}_$pkgver-4.debian.tar.xz)
sha256sums=('6a37c3cf6ff5dfd46b1b3127e1226404e43185fa73cd40e8144d5f7736eee9f0'
            '851aeea268c0212702b78b66f8f16be15c0eddc241c5bc2df41b0825f3a65a5b')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -Np1 -i ../debian/patches/0001-Bug-29915-CLO_EXEC.patch
  patch -Np1 -i ../debian/patches/0002-Bug-29915-NSS-error-reporting.patch
  patch -Np1 -i ../debian/patches/0003-Bug-29915-min-GID.patch
  patch -Np1 -i ../debian/patches/0004-Bug-29915-fseek-thread-safety.patch
  patch -Np1 -i ../debian/patches/0005-Bug-29915-strip-trailing-whitespace.patch
  patch -Np1 -i ../debian/patches/0006-Bug-39775-Fix-setgrent.patch
}     

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
