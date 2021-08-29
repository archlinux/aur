# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=5.4.2
pkgrel=2
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64')
url="https://www.apipost.cn/"
license=('custom')
depends=('gtk3' 'nss' 'libxss')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::https://www.apipost.cn/dl.php?client=Linux&arch=x64")
sha256sums=('bb70ce005027e73322371358fe503a18511856c98c4658b2d872c6d594c029e1')

package() {
  tar -xf data.tar.xz -C ${pkgdir}
  
  mv ${pkgdir}/opt/ApiPost ${pkgdir}/opt/${_pkgname}

  install -dm755 ${pkgdir}/usr/bin/
  ln -sf /opt/${_pkgname}/${_pkgname}  ${pkgdir}/usr/bin/${_pkgname}

  # desktop entry
  sed -i "s|/opt/ApiPost|/opt/${_pkgname}|g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
# vim: set sw=2 ts=2 et:
