# Maintainer: Clayton Craft <clayton at craftyguy dot net>
pkgname=grub2-signing-extension
pkgver=0.1
pkgrel=1
pkgdesc="Scripts for signing and verifying grub2 files for grub2's check_signatures feature."
arch=('any')
url="https://github.com/Bandie/grub2-signing-extension"
license=('GPL')
depends=('gnupg' 'grub')
source=(
  "https://github.com/Bandie/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/Bandie/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=(
  '40415286d3a3e92169fdffd11276420488cf123ae8a2b3c52974be815f90baba1809cac1806bb1af292118491d9d008a42a52542fd580e48582c8b43e43e7a4b'
  '88c9f51c3a868d054f8e70ef8926e8c7c5984adb412404e202bb0c2e3ccce5f971a301022762364dffb4b317217d00aa5f7c0ad3208d2001fd42eb6d06a7d6f7')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m744 sbin/grub2-verify "${pkgdir}/usr/bin/grub2-verify"
  install -D -m744 sbin/grub2-sign "${pkgdir}/usr/bin/grub2-sign"
  install -D -m744 sbin/grub2-unsign "${pkgdir}/usr/bin/grub2-unsign"
  install -D -m744 sbin/grub2-update-kernel-signature "${pkgdir}/usr/bin/grub2-update-kernel-signature"
}

# vim: ts=2 sw=2 et
