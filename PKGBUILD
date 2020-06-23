# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.3.15
_pkgname="${pkgname}-Natron-${pkgver}"
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=('fftw' 'libgl' 'libpng')
makedepends=('openmp')
source=("${_pkgname}.tar.xz::${url}/releases/download/Natron-${pkgver}/${_pkgname}.tar.xz")
sha512sums=('6b17753c443d1a7b66055329b9c91818eac6a96b80d23fe3d0c571ab627da333e399dde45bdb4864f5ac17f8b98b8feb43a4398e5ad8f4e2961594eccfbef6ba')

build() {
  cd "${srcdir}/${_pkgname}"
  make CONFIG=release \
       OPENMP=1
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/usr/OFX/Plugins"
  make install PLUGINPATH="${pkgdir}/usr/OFX/Plugins" \
               CONFIG=release

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}/COPYING" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/${_pkgname}/Licence_CeCILL-C_V1-en.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/${_pkgname}/Licence_CeCILL_V2-en.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/"
}
