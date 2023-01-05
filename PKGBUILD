# Maintainer: celeste <yuan.zx at outlook dot com>

pkgname=vaa3d-bin
_pkgname=${pkgname%-bin}
pkgver=v3.200
pkgrel=1
pkgdesc="3D Visualization-Assisted Analysis"
arch=('any')
url='www.vaa3d.org'
license=('custom')
depends=('libpng12')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('LICENSE::https://github.com/Vaa3D/Vaa3D_Wiki/wiki/LicenseAndAgreement.wiki'
        "${_pkgname}-${pkgver}.tar.gz::https://github.com/Vaa3D/release/releases/download/${pkgver}/Vaa3D_Ubuntu_64bit_${pkgver}.tar.gz")

sha256sums=('SKIP'
            'fa267a6b02b340f9ab01f671dbd681bd5da1814abf31596170344106c07c19d8')

package() {
  # binary
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/Vaa3D_Ubuntu_64bit_${pkgver}/* ${pkgdir}/opt/${pkgname}
  chmod 755 ${pkgdir}/opt/${pkgname}/${_pkgname}

  cat>"${_pkgname}"<<EOF
#!/bin/sh
export LD_LIBRARY_PATH=/opt/${pkgname}
/opt/${pkgname}/${_pkgname}
EOF
  install -Dm755 -t ${pkgdir}/usr/bin ${_pkgname}

  # license
  install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ ${srcdir}/LICENSE
}
