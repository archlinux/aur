# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Richard Graham <richard@rdg.cc>

_release='2010'
_short_release="${_release:2:4}"
_service_pack='1'
pkgname="labview-${_release}-rte"
pkgver="SP${_service_pack}"
pkgrel=1
pkgdesc='Run-Time Engine for LabVIEW by National Instruments.'
url="http://www.ni.com/labview/release-archive/${_release}/"
arch=('x86_64') # This will likely work on i686, but I have not tested it.
license=("custom:LabVIEW-${_release}")
depends=('llvm')
depends_x86_64+=('lib32-expat'
                 'lib32-gcc-libs'
                 'lib32-glibc'
                 'lib32-libdrm'
                 'lib32-libice'
                 'lib32-libsm'
                 'lib32-libx11'
                 'lib32-libxau'
                 'lib32-libxcb'
                 'lib32-libxdamage'
                 'lib32-libxdmcp'
                 'lib32-libxext'
                 'lib32-libxfixes'
                 'lib32-libxinerama'
                 'lib32-libxshmfence'
                 'lib32-libxt'
                 'lib32-libxxf86vm'
                 'lib32-mesa'
                 'lib32-mesa-libgl'
                 'lib32-util-linux')
optdepends=("labview-${_release}: Full LabVIEW platform.")
makedepends=('libarchive')
# http://www.ni.com/download/labview-run-time-engine-2010-sp1/2297/en/
# a3fa4b50a75b8394cb9f3e7cb6646dbb labview-2010-rte-10.0.1-1.i386.zip
source=("file://labview-${_release}-rte-${_short_release}.0.${_service_pack}-1.i386.rpm")
md5sums=('3a4f1541dde45dcf5f36d618fb039d8d') # Hash for the .rpm

package() {
  mkdir -p "${pkgdir}/usr/"

  cp -rp "${srcdir}/usr/local/lib/" "${pkgdir}/usr/"

  # Using out of date certificates is a horrible idea.
  ln --symbolic --force '/etc/ca-certificates/extracted/ca-bundle.trust.crt' \
    "${pkgdir}/usr/lib/LabVIEW-${_release}/ca-bundle.crt"
}

# vim:set et sw=2 sts=2 tw=80: