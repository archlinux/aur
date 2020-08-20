# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=disable-rtc
pkgname=${_pkgbase}-dkms
pkgver=1
pkgrel=1
_revision=1bd72723766be039f3af073f6ca2c2b69eef936e
pkgdesc="Disable real time clock (DKMS)"
arch=('x86_64')
url="https://github.com/isjerryxiao/disable-rtc"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("https://github.com/isjerryxiao/disable-rtc/archive/${_revision}.tar.gz"
        'dkms.conf')
sha512sums=('f0e7fb1ae562dec7d4320ade0067e11f854c9b061feb9777f067fb9f4e753213cf7974b02c135d67168bf2bee7d8a8724de17e529427901c17e32408f48a73a0'
            'ec7e4cf8cfe631d5e3985f5e3e4ecfade14bde45ac97a11d66629d3f843b6118513aee0980fc6e0def9915d44a96c3d40ded244a0c0b1c0df814836b8b940795')

package() {
  # Copy dkms.conf
  install -Dt "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -m644 dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -rT "disable-rtc-${_revision}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
