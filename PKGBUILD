# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/superm1/amdxdna-dkms
_pkgbase=amdxdna
pkgname=amdxdna-dkms
pkgdesc="amdxdna-dkms"
pkgver=7.0
pkgrel=1
arch=('x86_64')
url='https://github.com/superm1/amdxdna-dkms/'
license=('Apache-2.0')
depends=('dkms')
provides=('amdxdna')
_pkgverpath=7.0-drm-misc-fixes-02-26-27

source=(
"${_pkgbase}-${pkgver}.tar.gz::https://github.com/superm1/amdxdna-dkms/archive/refs/tags/v${_pkgverpath}.tar.gz"
dkms.conf
)

sha256sums=(  
'91e262da989f5bb7a3f3816bbb7ed18b0c9a561a56a009a6a0eed694b62ee8bb'
'fae6de4c164f771751516aa6710ac83941d97ceb02808225e317a1ba61c6d019'
)

package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  cd ${pkgname}-${_pkgverpath}/src
  cp -r include trace -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  cd amdxdna
  cp -r * -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  install -vDm644 ${srcdir}/dkms.conf -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}