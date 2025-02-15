# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="faircamp"
pkgname="${_pkgname}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="A static site generator for audio producers"
arch=('x86_64')
url="https://simonrepp.com/faircamp"
_url="https://codeberg.org/simonrepp/${_pkgname}"
license=('AGPL-3.0-or-later')
depends=('ffmpeg' 'gcc-libs' 'glibc' 'libvips>=8.13.3' 'openslide' 'opus'
         'poppler-glib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source=("${_pkgsrc}-ALTERNATIVES.md::${_url}/raw/tag/${pkgver}/ALTERNATIVES.md"
        "${_pkgsrc}-ARCHITECTURE.md::${_url}/raw/tag/${pkgver}/ARCHITECTURE.md"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/tag/${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-CREDITS.md::${_url}/raw/tag/${pkgver}/CREDITS.md"
        "${_pkgsrc}-README.md::${_url}/raw/tag/${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}/packages/${_pkgsrc//-/_}-1+deb12_amd64.deb")
sha256sums=('6228260876ad0e3a96a573ad5cc1eef5ed9614241c593289e4042247a3bb3887'
            '47189358305e78a84e2ef4a00223e6593909bd14d35ef99ebf033cd4bed81983'
            'c3d5f1b3dce03fb643e76793b141edc4eebe10ffb88c83703c4aea5b27272f3d'
            '57dc2c4356225b1c59eb1adb08cac2ebefc189ac0a9fc371db42d19d7959b12b'
            '2811f2ccf2ba1e28a564aa3fda30f6a0b6966fcc92eb45c8b1ce1311488f1f22')
sha256sums_x86_64=('8dff0755f98bad575ef539d4987154a92c3af4ccdad093f1b63c37eb5f86a69d')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr"
  rm -rf "share"
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-ALTERNATIVES.md" "${pkgdir}/usr/share/doc/${_pkgname}/ALTERNATIVES.md"
  install -vDm644 "${_pkgsrc}-ARCHITECTURE.md" "${pkgdir}/usr/share/doc/${_pkgname}/ARCHITECTURE.md"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-CREDITS.md" "${pkgdir}/usr/share/doc/${_pkgname}/CREDITS.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
