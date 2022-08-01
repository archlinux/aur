# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=luks-tpm2
pkgver=2.1.2
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
sha256sums=('2b0ddcca8de05f093754ccf2665f675af9ddf6ad55f17e07727db107d7666398'
            '4ee1068d53882c89e4130d972a549cb594fbca0ec21b38a2a4786986f177962b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install files
  install -Dm755 luks-tpm2 ${pkgdir}/usr/bin/luks-tpm2
  install -Dm644 default ${pkgdir}/etc/default/luks-tpm2
  install -Dm644 ${srcdir}/luks-tpm2.hook ${pkgdir}/usr/share/libalpm/hooks/luks-tpm2.hook
} 
