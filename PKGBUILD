# Maintainer: mellotanica <mellotanica(at)gmail(dot)com>

_pkgbase=snd-usb-audio-fasttrack
pkgname="${_pkgbase}-dkms"
pkgver=1
pkgrel=1
pkgdesc="snd-usb-audio module patched to fix regular xruns with M-Audio Fast Track sound cards (DKMS)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
conflicts=("${_pkgbase}")
source=('dkms.conf'
        'dkms-patchmodule.sh'
        'snd-usb-audio-fasttrack.conf')
md5sums=('c97804de86e8ee3a460a94eee34a717c'
         'deea7306ae798e73c4e40b13c62becad'
         'c989a22b9b174462d2b0201f689e11f1')

package() {
  # Copy dkms.conf and patch script
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  install -Dm755 dkms-patchmodule.sh "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms-patchmodule.sh

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy modprobe conf
  install -Dm644 snd-usb-audio-fasttrack.conf "${pkgdir}"/etc/modprobe.d/snd-usb-audio-fasttrack.conf
}
