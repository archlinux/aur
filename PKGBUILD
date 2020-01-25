# Maintainer: Clayton Craft <clayton at craftyguy dot net>
# Co-Maintainer: Bandie <bandie at chaospott dot de>
pkgname=grub2-signing-extension
pkgver=0.1.5
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
  '4e990be40978f5f68d2fe73a53fe3730ee04f2fc907293df05d80068e1eb80637c2deb8c9b6b81e409fbd9d5f167090886fba189c58e0a2843219307c150906b'
  'SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m744 sbin/grub-verify "${pkgdir}/usr/bin/grub-verify"
  install -D -m744 sbin/grub-sign "${pkgdir}/usr/bin/grub-sign"
  install -D -m744 sbin/grub-unsign "${pkgdir}/usr/bin/grub-unsign"
  install -D -m744 sbin/grub-update-kernel-signature "${pkgdir}/usr/bin/grub-update-kernel-signature"
}

# vim: ts=2 sw=2 et
