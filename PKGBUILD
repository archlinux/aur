# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="faircamp"
pkgname="${_pkgname}-bin"
pkgver=1.1.1
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
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}/packages/${_pkgsrc//-/_}-1+deb12_amd64.deb")
sha256sums=('6228260876ad0e3a96a573ad5cc1eef5ed9614241c593289e4042247a3bb3887'
            '85f8be57e130612859e89bf4eb51ba390db1783eee925bbd002a83ba5235386e'
            'a5b4460dfdf0da78319372efb12cb7e889b14d726080315df3e7902d5cb41a3a'
            'db39b8853f460f861d00d2c7ee628a7fbeea90d0f4281d28e672529e1863d14a'
            '2d9781b2aeba694d986f4cd1bfa6f4720f5e0336e4c31aee19da7df38cfa6ea4'
            '863bec7aec72845b65c42bc833a594670f1ec38e43225ef526ed775e6b697e6c')
sha256sums_x86_64=('f7356c6bbd3757e572cb87e0e0985e1dd7930bd020151f6902d5d179a14e6c0d')

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
