# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>

pkgname=openmv-ide-bin
_pkgname=${pkgname%-bin}
pkgver=5.1.0
pkgrel=1
pkgdesc="QtCreator based OpenMV IDE."
arch=('x86_64')
url="https://github.com/openmv/openmv-ide"
license=('MIT')
# dependencies based on the contents of the setup.sh script.
depends=('fontconfig'
  'freetype2'
  'libxcb'
  'libpng'
  'libusb'
  'python-pyusb')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("https://github.com/openmv/openmv-ide/releases/download/v${pkgver}/${_pkgname}-linux-x86_64-${pkgver}.tar.gz")
sha256sums_x86_64=('3baa87a17290f50a149fdefac93f40dc964a27bb3194e1d1c62dc45eac00c9bf')

package() {
  cd ${srcdir}/${_pkgname}

  install -dm755 ${pkgdir}/opt/${_pkgname}
  cp -r * ${pkgdir}/opt/${_pkgname}

  install -Dm644 share/applications/io.openmv.openmvide.desktop \
    ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon
  cp -r share/icons ${pkgdir}/usr/share/icons

  # soft link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/bin/${_pkgname/-/} ${pkgdir}/usr/bin/${_pkgname/-/}

  # udev rule
  install -Dm644 share/qtcreator/pydfu/{99-openmv,99-openmv-arduino,99-openmv-nxp}.rules -t ${pkgdir}/usr/lib/udev/rules.d/
}

# vim: set sw=2 ts=2 et:
