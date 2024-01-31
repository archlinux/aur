# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=ddwarf
pkgver=0.83
pkgrel=4
pkgdesc='Digger Dwarf is a console-based Gopher client'
license=('GPL-3.0-only')
arch=('i686' 'x86_64')
makedepends=('freebasic')
depends=('bind-tools')
url="http://mateusz.viste.fr/software/${pkgname}"
source=("${url}/${pkgname}083-src.zip"
        "${pkgname}.patch")
sha256sums=('03b6acdd16bcc44bf36e38ba8aab5fa21509703422c0c0b9c8cd466dadcee5a5'
            '27b084e6e873f730148774cf6813e7f0483f390c49b3d2332d5d3e14a360fec6')

build() {
  cd ${srcdir}
  patch -p0 -i ./${pkgname}.patch 

  echo "Building chisock"
  cd "${srcdir}/chisock"
  fbc *.bas -g -mt -lib -x libchisock.a

  echo "Building ddwarf"
  cd "${srcdir}"
  cp ./chisock/libchisock.a .
  fbc -mt ddwarf.bas
}

package() {
  install -D "${srcdir}/ddwarf" "${pkgdir}/usr/bin/${pkgname}"
}
