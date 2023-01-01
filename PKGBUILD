# Maintainer: Pelle Windestam <pelle@windestam.se>
_pkgname="s2253"
pkgname="s2253-dkms"
pkgver="1.2.16"
pkgrel="1"
pkgdesc="Driver for the Sensoray 2253 USB frame grabber"
arch=("x86_64")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("dkms")
license=("GPL2")
url="http://www.sensoray.com/products/2253.htm"
source=("https://www.sensoray.com/downloads/sdk_x53_linux_1.2.16.tar.bz2"
        "dkms.conf")
sha256sums=("5a6b16797ec0187df4bda863e0f87651ff3f31b29f1ad6003ce740407e10c4a2"
            "d6074cc3b24eb86a53571175b4ce6b58510f04f1c5a022041bb8c76ad9d58eed")

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

    cp -r sdk_x53_linux_${pkgver}/driver/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
}
