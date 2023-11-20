# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=luks-tpm2
pkgver=2.2.0
pkgrel=1
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
sha256sums=('9cefcea74ed9589fd2e618022348596fd7dbefd4b311660dc11aa67989bfed8b'
            '4ee1068d53882c89e4130d972a549cb594fbca0ec21b38a2a4786986f177962b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install files
  install -Dm755 luks-tpm2 ${pkgdir}/usr/bin/luks-tpm2
  install -Dm644 default ${pkgdir}/etc/default/luks-tpm2
  install -Dm644 ${srcdir}/luks-tpm2.hook ${pkgdir}/usr/share/libalpm/hooks/luks-tpm2.hook
} 
