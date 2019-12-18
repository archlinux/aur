# Maintainer: SebRmv
_pkgbase=ia32_aout
pkgname=ia32_aout-dkms
pkgver=5.4
pkgrel=2
pkgdesc='ia32_aout kernel module, for running an a.out binary format (DKMS)'
arch=('x86_64')
depends=('dkms')
url="https://www.kernel.org"
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
license=("GPLv3")
options=('!strip')
source=("https://raw.githubusercontent.com/torvalds/linux/v${pkgver}/arch/x86/ia32/ia32_aout.c"
        'Makefile'
        'dkms.conf')
# updpkgsums
sha1sums=('ec51162ce24aa0711cce26cd6341a045f739997d'
          '843ea355c7475bd77408814e2a48a53af4856d8d'
          '42244650cd11033033f49a7909e5825584afd0cb')

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp ia32_aout.c Makefile dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/  

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
