# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com.
# Contributor: Meow King <mr.ziqiyang@gmail.com>

_Name="FlyingCarpet"
_pkgname="flying-carpet"
pkgname="${_pkgname}-bin"
pkgver=9.0.9
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
arch=(
  'x86_64'
)
url="https://github.com/spieglt/${_Name}"
license=(
  'GPL-3.0-only'
)
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=(
  "${_pkgname}"
) 
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.txt::${url}/raw/refs/tags/v${pkgver}/LICENSE.txt"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.deb::${url}/releases/download/v${pkgver}/linux_${_Name}_${pkgver}_amd64.deb"
)
noextract=(
  "${source_x86_64[@]%%::*}"
)
sha256sums=('02926e6f66a22662379baadc51b93993e03187bf3b21cb12a278f60230d5ab7e'
            '68fc3b3e41307c4fb2f0174896f9549240e84b60865064f8dd70dffa65f7b5b1')
sha256sums_x86_64=('861145598eb50aece47044bec4027b129a8daf2055d3f6583f3f31714eeed499')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}/usr"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}/usr"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${_pkgsrc}-${CARCH}" "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
