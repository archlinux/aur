# Maintainer:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Farhad Shahbazi <farhad@enthusiasm.cc>

pkgname=fontviewer
pkgver=0.5.3
pkgrel=2
pkgdesc="Font Viewer written in Tcl/Tk"
url="https://github.com/siyb/fontviewer"
arch=("any")
license=("custom:BSD")
depends=("tcl" "tk")
source=("${pkgname}-${pkgver}.tar.gz::${url}/tarball/${pkgver}")
md5sums=("c6cbb5a2fa1c62632bcbab5cefe175df")

build() {
  cd "${srcdir}"
  mv -vT siyb-fontviewer-* "${pkgname}-${pkgver}" || rm -rf siyb-fontviewer-*

  cd "${srcdir}/${pkgname}-${pkgver}"
  sed "s|#!/usr/bin/env wish8.5|#!/usr/bin/env wish|g" -i fontviewer.tcl
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
