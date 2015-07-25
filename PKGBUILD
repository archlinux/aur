# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Ng Oon-Ee <ngoonee@gmail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-linuxtools
pkgver=4.0.0
pkgrel=1
pkgdesc="Eclipse Linux Tools Project"
url="http://www.eclipse.org/linuxtools"
arch=('any')
license=('EPL')
depends=('eclipse-cpp')
optdepends=(
	'eclipse-ptp: remote profiling'
	'eclipse-rse: LTTng and remote profiling'
	'eclipse-gef: Draw2d and Zest'
	'eclipse-tcf: legacy LTTng'
	'eclipse-antlr-runtime: Tracing/LTTng'
)
makedepends=('java-environment')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/linuxtools/linuxtools-${pkgver}.zip")
sha256sums=('541d4f75911b9f52a81b26ded143deea52d46fc08a994a686b6edb9972a2af72')

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/linuxtools/eclipse"

  cd "${srcdir}"

  # Features
  for _f in features/*; do
    _dir="${_dest}/${_f/.jar}"
    mkdir -p "${_dir}"
    bsdtar -xf "${_f}" -C "${_dir}"
  done

  # Plugins
  for _p in plugins/*; do
    install -Dm644 "${_p}" "${_dest}/${_p}"
  done
}
