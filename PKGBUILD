# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="spotify_player"
_pkgname="${_binname//_/-}"
pkgname="${_pkgname}-bin"
pkgver=0.20.1
pkgrel=1
pkgdesc="A Spotify player in the terminal with full feature parity"
arch=('x86_64' 'aarch64')
url="https://github.com/aome510/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc' 'openssl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64}".tar.gz")
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname//-/_}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname//-/_}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('e2af10cd305a168cc3053b92c361d4459401992522036ca4ee7832c03babcbcf'
            'e72a19894db78d4bb02cb1eff86920cddabd23b56d03f2f20850e07452db86d5')
sha256sums_x86_64=('7c5a508c95b21c908f8e1510a5ae206457de0fad4fb08bc97514ad26ef396275')
sha256sums_aarch64=('57a8693d929dd7ff5d742d3c72717255300625efb9ff68ed288387dcd0359593')

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
