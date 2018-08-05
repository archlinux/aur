# Maintainer: Clayton Craft <clayton at craftyguy dot net>
pkgname=grub2-signing-extension
pkgver=0.1.2
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
  '7212dd67a856b50e07464a624d4e7bf364bbb7bbc2d7ab1cbdf4b7a32bf886f4cbbc4e67d1003100f979c971995951e3a7e197a4e208e57f6e445836a4e45704'
  '0a0413f55dfeba19cce40587936f7cb631752dcf4dff4d1f4d43f5ab5d1ff15e09adf2c886a5143431bf538af3429a18c3ef8f485640a0aa2dd2fa5ec07c2635')

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
