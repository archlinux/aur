# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=3.2.3
pkgrel=1
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64')
url="https://www.apipost.cn/"
license=('custom')
depends=('gtk3' 'nss' 'libxss')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://img.cdn.apipost.cn/download/linux/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('7504919ed2bf0009cbc0f36c4534be58c8bff96632a5e58916e4c8eb39e2358a')

prepare() {
  mkdir -p build
  tar -xf data.tar.xz -C build 
}

package() {
  cd build
  install -dm755 ${pkgdir}/opt/

  cp -r usr/lib/${_pkgname} ${pkgdir}/opt/

  # desktop entry
  install -Dm644 usr/share/applications/apipost.desktop -t ${pkgdir}/usr/share/applications

  # icon
  install -Dm644 usr/share/pixmaps/apipost.png -t ${pkgdir}/usr/share/pixmaps/

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -sf /opt/${_pkgname}/ApiPost ${pkgdir}/usr/bin/${_pkgname}

  # copyright
  install -Dm644 usr/share/doc/apipost/copyright -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
