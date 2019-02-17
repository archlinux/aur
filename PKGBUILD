# Maintainer: Clayton Craft <clayton at craftyguy dot net>
pkgname=grub2-signing-extension
pkgver=0.1.3
pkgrel=1
pkgdesc="Scripts for signing and verifying grub2 files for grub2's check_signatures feature."
arch=('any')
url="https://github.com/Bandie/grub2-signing-extension"
license=('GPL')
depends=('gnupg' 'grub')
source=(
  "https://github.com/Bandie/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/Bandie/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('9b43173253a8cc8bde3d37b636c919563f9055a30e8ba27d430ab4696c285fe2d4ea19f3d37d04b375abd2b44149271d7ceb0a18eb2625ff04bfed1490e863ac'
            'SKIP')

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
