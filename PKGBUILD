# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Premake"
_name="${_Name,,}"
pkgver=4.4beta5
pkgname="${_name}${pkgver%%.*}"
pkgrel=1
pkgdesc="A simple build configuration and project generation tool"
arch=('i686' 'x86_64')
url="https://premake.github.io"
license=('BSD-3-Clause')
depends=('glibc')
_pkgsrc="${_name}-${pkgver//beta/-beta}"
source=("${_pkgsrc}.zip::https://downloads.sourceforge.net/project/${_name}/${_Name}/${pkgver%%beta*}/${_pkgsrc}-src.zip")
sha256sums=('0fa1ed02c5229d931e87995123cdb11d44fcc8bd99bba8e8bb1bbc0aaa798161')

build() {
  cd "${srcdir}/${_pkgsrc}/build/gmake.unix"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "bin/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.txt"  "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
