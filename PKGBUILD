# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="faircamp"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
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
source=("ALTERNATIVES-${pkgver}.md::${_url}/raw/tag/${pkgver}/ALTERNATIVES.md"
        "ARCHITECTURE-${pkgver}.md::${_url}/raw/tag/${pkgver}/ARCHITECTURE.md"
        "BUILD-${pkgver}.md::${_url}/raw/tag/${pkgver}/BUILD.md"
        "CHANGELOG-${pkgver}.md::${_url}/raw/tag/${pkgver}/CHANGELOG.md"
        "CREDITS-${pkgver}.md::${_url}/raw/tag/${pkgver}/CREDITS.md"
        "README-${pkgver}.md::${_url}/raw/tag/${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://simonrepp.com/${_pkgname}/packages/${_pkgsrc//-/_}-1+deb12_amd64.deb")
sha256sums=('6228260876ad0e3a96a573ad5cc1eef5ed9614241c593289e4042247a3bb3887'
            '85f8be57e130612859e89bf4eb51ba390db1783eee925bbd002a83ba5235386e'
            'a5b4460dfdf0da78319372efb12cb7e889b14d726080315df3e7902d5cb41a3a'
            '04c4ef25aaaf97f612969f19de970f4081300ed314d66698ac698e95228e37a0'
            '8a542e9198bc721b9d53034cd0e29562f3c7daf3fba476f458ba885b9fc21956'
            '0879b750ba3a49587ce39de080dfbda448aaf606e3886008d1ff59f2e83e10ac')
sha256sums_x86_64=('d33d9c4fb8b3deae0eceba0821d26c37741f33598e2bc32489a2f78f9e1e0c04')

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
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"

  cd "${srcdir}"
  install -vDm644 "ALTERNATIVES-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/ALTERNATIVES.md"
  install -vDm644 "ARCHITECTURE-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/ARCHITECTURE.md"
  install -vDm644 "BUILD-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/BUILD.md"
  install -vDm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "CREDITS-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/CREDITS.md"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
