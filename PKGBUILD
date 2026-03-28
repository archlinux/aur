# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jon Wiersma (archaur at jonw dot org)

_name="segymat"
pkgname="matlab-${_name}"
pkgver=1.8
pkgrel=1
pkgdesc="Read and write SEGY formatted files using Matlab/Octave"
arch=(
  'any'
)
url="https://segymat.readthedocs.io/"
_url="https://github.com/AUProbGeo/${_name}"
license=(
  'GPL-2.0-or-later'  # per .m file headers
  'LGPL-2.1-or-later' # per LICENSE file
)
optdepends=(
  'matlab: support for MATLAB'
  'octave: support for Octave'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('52b5bc6bf4fefa3169be5789a1240ac5fd914c1cb712180b8b5a2d45f1d5a450')

package() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f \( -name '*.m' -o -name '*.fig' -o -name '*.segy' \) -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/matlab/SegyMAT/{}" \;

  install -vDm644 "Readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
