# Maintainer: Clayton Craft <clayton at craftyguy dot net>
pkgname=grub2-signing-extension
pkgver=0.1.4
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
  'f3aae11b410b79d0b8d0b9d95208f309f1f73c197d8d63fada8574ef44547f6dcd4ebafecda51a4b2f967e085e0272c83c2b3e99b45ee32b610aab38045bd11a'
  'd52e37ae755ce493c26b809ab1195b7553ab6f0168827f6a6f7af0bd0c39058363f1c703c72d4592bc9d12cf6bbbebd75946f196e81c07384a266ac75a3fe39f')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m744 sbin/grub-verify "${pkgdir}/usr/bin/grub2-verify"
  install -D -m744 sbin/grub-sign "${pkgdir}/usr/bin/grub2-sign"
  install -D -m744 sbin/grub-unsign "${pkgdir}/usr/bin/grub2-unsign"
  install -D -m744 sbin/grub-update-kernel-signature "${pkgdir}/usr/bin/grub2-update-kernel-signature"
}

# vim: ts=2 sw=2 et
