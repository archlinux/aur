# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="spotify_player"
_pkgname="${_binname//_/-}"
pkgname="${_pkgname}-bin"
pkgver=0.19.1
pkgrel=1
pkgdesc="A Spotify player in the terminal with full feature parity"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc' 'openssl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,armv7}".tar.gz")
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname//-/_}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname//-/_}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname//-/_}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('ee247f6895f2690c9b2753ef816314af2a0831ed88c050f1909726bebec9b08c'
            'e72a19894db78d4bb02cb1eff86920cddabd23b56d03f2f20850e07452db86d5')
sha256sums_x86_64=('3bd936f16cbfa859da515256c472f2994eea93266f00edd5116f952121620958')
sha256sums_aarch64=('2a2110bc638c7d1978b54e436d600e1f22b047dcbdc29957066e43f0a967fd00')
sha256sums_armv7h=('fda930f21e8708ded69dfcacdcd05dd7ccd41bcbe1431071de00c50c8a0c4355')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  mv -f "README-${pkgver}.md" "${_pkgsrc}-${CARCH}/README.md"
  mv -f "LICENSE-${pkgver}"   "${_pkgsrc}-${CARCH}/LICENSE"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
