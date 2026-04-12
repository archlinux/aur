# Maintainer: Fernando Canatta <your-email-here>
# Previous Maintainer: Julio González <juliolokooo@gmail.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>

pkgname=sardi-icons
pkgver=25.10
pkgrel=1
pkgdesc='Icon theme for Linux operating systems'
arch=('any')
url='https://sourceforge.net/projects/sardi/'
license=('custom:CCPL:by-nc-sa')
depends=()
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/sardi/${pkgname}-${pkgver}-0${pkgrel}.tar.gz")
sha256sums=('3d28c31a94d7248e40b536c8cef19a812b4fc1d90353294bf962410e1b4730a6')

package() {
  local _iconsdir="${pkgdir}/usr/share/icons"
  local _srcdir="${srcdir}/${pkgname}-${pkgver}"

  install -d "${_iconsdir}"

  # Upstream tarball may either unpack into a versioned directory or directly into srcdir.
  if [[ -d "${_srcdir}" ]]; then
    cp -a "${_srcdir}"/* "${_iconsdir}/"
  else
    find "${srcdir}" -type f -name '*.sh' -exec chmod 0644 '{}' +
    cp -a "${srcdir}"/* "${_iconsdir}/"
    rm -f "${_iconsdir}/${pkgname}-${pkgver}.tar.gz"
  fi
}
