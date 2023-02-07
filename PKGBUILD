# Maintainer: celeste <yuan.zx at outlook dot com>

pkgname=vaa3d-bin
_pkgname=${pkgname%-bin}
pkgver=v3.601
pkgrel=1
pkgdesc="3D Visualization-Assisted Analysis"
arch=("any")
url="https://www.vaa3d.org"
license=("custom")
depends=("libpng12" "libtiff5")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("LICENSE::https://github.com/Vaa3D/Vaa3D_Wiki/wiki/LicenseAndAgreement.wiki"
        "${_pkgname}-${pkgver}.tar.gz::https://github.com/Vaa3D/release/releases/download/${pkgver}/Vaa3D_CentOS_64bit_${pkgver}.tar.gz")
sha256sums=("SKIP"
            "d6f102c502a7be367ea7854bf561e492997ce0c19b4a0ad926fe1b308eead4f0")

package() {
  # license
  install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ ${srcdir}/LICENSE

  # binary
  rm ${srcdir}/bin/libstdc++.so.6*
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/bin/* ${pkgdir}/opt/${pkgname}
  chmod 755 ${pkgdir}/opt/${pkgname}/${_pkgname}

  cat>"${_pkgname}"<<EOF
#!/bin/sh
export LD_LIBRARY_PATH=/opt/${pkgname}
/opt/${pkgname}/${_pkgname}
EOF
  install -Dm755 -t ${pkgdir}/usr/bin ${_pkgname}
}
