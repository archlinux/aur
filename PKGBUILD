# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: Kevin_Liu <we123445@outlook.com>

pkgname=vofa+
_pkgname=vofaplus
pkgver=1.3.10
pkgrel=3
pkgdesc="A high degree of freedom embedded debugging tool with plugins support."
arch=('x86_64')
url="https://www.vofa.plus/"
license=('unknown')
provides=("${_pkgname}")
options=('!strip')
source=("${pkgname}-${pkgver}.pkg.tar.zst::https://je00.github.io/downloads/${pkgname}-${pkgver}-1-${CARCH}.pkg.tar.zst")
sha256sums=('83b43cd3b8b72725e11c8433e88dea4246e0f39070215705904b17ddc30149ed')

package() {
  cd ${srcdir}/opt/${pkgname}/

  # fix the wrong permission of the files
  for _dir in doc lib plugins qml translations
  do
    find $_dir -type f -exec install -Dm 644 {} ${pkgdir}/opt/${pkgname}/{} \;
  done

  # icon
  install -Dm 644 ${pkgname}.png -t ${pkgdir}/opt/${pkgname}/ 

  # qt.conf
  install -Dm 644 qt.conf -t ${pkgdir}/opt/${pkgname}/ 

  # binary
  install -Dm 755 ${pkgname} -t ${pkgdir}/opt/${pkgname}/ 

  # desktop entry
  install -Dm 644 ${srcdir}/usr/share/applications/${pkgname}.desktop -t ${pkgdir}/usr/share/applications/

  # symbolic link
  install -dm755 ${pkgdir}/usr/bin/
  ln -sf /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
 }
# vim: set sw=2 ts=2 et:
