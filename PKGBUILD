# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=edrawproject-bin
_pkgname=${pkgname%-bin}
_binaryname=EdrawProject
pkgver=1.3
pkgrel=1
pkgdesc="Edraw Project is  a professional gantt chart tool to schedule."
arch=('x86_64')
url="https://www.edrawsoft.cn/download/edrawproject/"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.deb::https://www.edrawsoft.cn/2download/${_pkgname}-1-amd64-cn.deb"
        "LICENSE::https://www.edrawsoft.cn/private-policy/")
sha256sums=('a48e00954e10df60c441346809c152fe3a1ccf03e0c6f6429fecbf5113c69607'
            'SKIP')

prepare () {

  install -dm 755 ${srcdir}/${_pkgname}
  tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/${_pkgname}
}

package() {

  #rename dir
  install -dm755 ${pkgdir}/opt/${_pkgname}
  mv ${srcdir}/${_pkgname}/opt/EdrawProject-1/* ${pkgdir}/opt/${_pkgname}

  # install desktop entry
  install -Dm 644 ${srcdir}/${_pkgname}/usr/share/applications/${_pkgname}.desktop  -t ${pkgdir}/usr/share/applications

  sed -i "s|EdrawProject-1|${_pkgname}|g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # link to /usr/bin
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_binaryname}  ${pkgdir}/usr/bin/${_binaryname}

  # install LICENSE
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim: set sw=2 ts=2 et:
