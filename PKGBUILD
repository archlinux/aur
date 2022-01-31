# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=luks-tpm2
pkgver=2.1.1
pkgrel=2
pkgdesc="Utility to manage LUKS keys sealed by a TPM 2.0"
arch=('any')
url="https://github.com/electrickite/${pkgname}"
license=('GPL3')
install="${pkgname}.install"
backup=('etc/default/luks-tpm2')
depends=('tpm2-tools>=4.0'
         'cryptsetup'
         'bash'
         'coreutils'
         'util-linux'
         'grep')
optdepends=('tpm_futurepcr: To pre-compute kernel PCR values')

source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.hook")
sha1sums=('3c446f7a8796abc9552c7402c03343f7a52e20f9'
          'e4b308b4e789d0ca9f1659b22ad0cd9193749558')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install files
  install -Dm755 luks-tpm2 ${pkgdir}/usr/bin/luks-tpm2
  install -Dm644 default ${pkgdir}/etc/default/luks-tpm2
  install -Dm644 ${srcdir}/luks-tpm2.hook ${pkgdir}/usr/share/libalpm/hooks/luks-tpm2.hook
} 
