# Maintainer: Clayton Craft <clayton at craftyguy dot net>
# Co-Maintainer: Bandie <bandie at chaospott dot de>
pkgname=grub2-signing-extension
pkgver=0.1.6
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
  'b4f9dd4e39f715132855c2efa11557df20d4e753fddc68ed1e415628f88485c1a7ea795c562f680167641e5ba1160a5bd710ead489e9523a23721b1ce26de20d'
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
