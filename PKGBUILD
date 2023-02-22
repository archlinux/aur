# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=edrawproject-bin
_pkgname=${pkgname%-bin}
_binaryname=EdrawProject
pkgver=1.4.0
pkgrel=1
pkgdesc="Professional gantt chart tool to schedule."
arch=('x86_64')
url="https://www.edrawsoft.cn/download/edrawproject/"
license=('unknown')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.deb::https://www.edrawsoft.cn/2download/amd64/${_pkgname}_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::https://www.edrawsoft.cn/private-policy/")
sha256sums=('085c870bf1bce8cbcd9e011daec6b1333b7f90023f1fb4ae9ce650b08eecf187'
            'fb6be7511c37752d4a15265f1e75663f138bba2aa18a1b431dd0634c75d9142e')

prepare () {
  # extract
  install -dm 755 ${srcdir}/${_pkgname}
  tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/${_pkgname}
}

package() {
  # rename dir
  install -dm755 ${pkgdir}/opt/${_pkgname}
  mv ${srcdir}/${_pkgname}/opt/EdrawProject-1/* ${pkgdir}/opt/${_pkgname}

  # desktop entry
  install -Dm 644 ${srcdir}/${_pkgname}/usr/share/applications/${_pkgname}.desktop  -t ${pkgdir}/usr/share/applications

  sed -i "s|EdrawProject-1|${_pkgname}|g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # link to /usr/bin
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_binaryname}  ${pkgdir}/usr/bin/${_pkgname}

  # LICENSE
  install -Dm644 ${srcdir}/LICENSE-${pkgver} -t ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim: set sw=2 ts=2 et:
