# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="matlab-documentation"
pkgver=R2025a+25.1.0.2934551
_release="${pkgver%%+*}"
_version="${pkgver##*+}"
pkgrel=1
epoch=1
pkgdesc="A high-level language for numerical computation and visualization (documentation)"
arch=('any')
url="https://www.mathworks.com/help/install/ug/install-documentation-on-offline-machines.html"
license=('custom:MATLAB EULA')
depends=("matlab-release=${_release}")
_pkgsrc="${pkgname}-${_release}"
source=("${_pkgsrc}.iso::https://www.mathworks.com/doc-iso-${_release,,}-linux")
sha256sums=('SKIP')

prepare() {
  chmod -R ug+Xwr "${srcdir}"
}

pkgver() {
  cd "${srcdir}"
  local rel ver
  rel="$(sed -n 's:.*<release>\(.*\)</release>.*:\1:p' VersionInfo.xml)"
  ver="$(sed -n 's:.*<version>\(.*\)</version>.*:\1:p' VersionInfo.xml)"
  echo "$rel+$ver"
}

package() {
  cd "${srcdir}/bin/glnxa64"
  ./mpm install-doc --matlabroot="/opt/MATLAB/${_release}" --destination="${pkgdir}/opt/MATLAB/${_release}"

  # cd "${pkgdir}"
  # find . -type f | while read -r filepath; do
  #   if [[ -e "${filepath#.}" ]]; then
  #     mv -v "$filepath" "$filepath.append"
  #   fi
  # done
}
