# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="faircamp"
pkgname="${_pkgname}-bin"
pkgver=1.4.0
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
            'fe2940e7e351f99600dd9640d5b4273a2027598092e627a1799c7c26dd2f96ac'
            '8d14cb5adf6689dbd3c9eb2415014e42b923d3f93f214a52fbff7929e7f11594'
            '4e31d93f62851f71b53a2be259f5b63509937e35887a97298908ebb359ceff7e'
            '9294376e49663738c0a6e691a36d6428d91f8448f92cf55f52aaf2ef383372f6')
sha256sums_x86_64=('f7fc2e0ebe3dbd3bdabd226ea713763448fb9a7da2f3c62bc3030cee113a3449')

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
