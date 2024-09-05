# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3splt"
pkgname="${_pkgname}-bin"
pkgver=2.6.2
pkgrel=1
pkgdesc="Split mp3, ogg, and flac files without decoding - CLI"
arch=('x86_64' 'i686')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmp3splt>=0.9.2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb"
           "${_pkgsrc}-i686.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.wheezy_amd64.deb")
source_i686=("${_pkgsrc}-i686.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.wheezy_i386.deb")
sha256sums_x86_64=('28520203c23d9cc00346779b731ce753f44e3f8503400d2bd46ceb9257b667ad')
sha256sums_i686=('a59ef6da1dc5265076f14c92de126c180f29cde85d7af6ffd275c824dfd329cf')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" "data.tar.gz"
  bsdtar -xzf "data.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f "data.tar.gz"
}

package() {
  cd "${srcdir}"
  cp -r "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  rm -f "changelog.gz" "ChangeLog.gz" "copyright" "INSTALL" "NEWS.gz"

  cd "${pkgdir}/usr"
  find "bin"   -type f -exec chmod 755 {} +
  find "share" -type f -exec chmod 644 {} +
}
