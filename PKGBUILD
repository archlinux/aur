# Maintainer: Clayton Craft <clayton at craftyguy dot net>
# Co-Maintainer: Bandie <bandie at chaospott dot de>
pkgname=grub2-signing-extension
pkgver=0.1.7
pkgrel=2
pkgdesc="Scripts for signing and verifying grub2 files for grub2's check_signatures feature."
arch=('any')
url="https://github.com/Bandie/grub2-signing-extension"
license=('GPL')
depends=('gnupg' 'grub')
validpgpkeys=('E2D7876915312785DC086BFCC1E133BC65A822DD')
source=(
  "https://github.com/Bandie/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/Bandie/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=(
  '06d8549528d5a75c34e9adc304117abe487badb9aa6bd094ca67b81f054158515f61c7311d26833846ec5f6e28e20fa618902d1aca658749c0a49613db8adf6f'
  'ec6cb911b6a47ed72e92f8e0b5fa56525ff4373d0f86c509b7b64cbb2aeb38bc7fcd8d8ef5a09d734287c699f503833814c3de7b550cc7f28d7acaef0f8b5b2a')

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
