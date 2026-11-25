# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>

pkgname=ladybird-bin
pkgver=2026.47.8
_debrel=1~ubuntu26.04
pkgrel=1
pkgdesc='Truly independent web browser (alpha release)'
arch=(x86_64 aarch64)
url='https://ladybird.org'
license=(BSD-2-Clause)
depends=(gcc-libs glib2 glibc libdrm libglvnd libpulse libxcb qt6-base qt6-positioning ttf-liberation vulkan-icd-loader wayland xcb-util-wm)
optdepends=('ffmpeg: additional media codecs')
provides=(ladybird)
conflicts=(ladybird)
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/LadybirdBrowser/ladybird/${pkgver}/LICENSE")
source_x86_64=("https://apt.ladybird.org/pool/main/l/ladybird/ladybird_${pkgver}-${_debrel}_amd64.deb"{,.asc})
source_aarch64=("https://apt.ladybird.org/pool/main/l/ladybird/ladybird_${pkgver}-${_debrel}_arm64.deb"{,.asc})
validpgpkeys=('4F3D5DFE64EBD9BB35D58FBDCF9EF7324C4B27AE') # Ladybird APT repository <https://apt.ladybird.org/ladybird.asc>
noextract=("ladybird_${pkgver}-${_debrel}_amd64.deb" "ladybird_${pkgver}-${_debrel}_arm64.deb")
sha256sums=('275f18944ac7ba41acabbb468387c1c9e8e2f81f7d49e6442dafe37c25ffeea7')
sha256sums_x86_64=('3fffea5f917ce3a79415964e24314e89a47bea4543d79f719419c36d7ace2c73'
                   'SKIP')
sha256sums_aarch64=('6594323ac4145fbbc67d23e986f1b792b3003f70c2424d5765cb7372e68a4aa6'
                    'SKIP')

package() {
  local _debarch=amd64
  [[ $CARCH == aarch64 ]] && _debarch=arm64

  bsdtar -xOf "ladybird_${pkgver}-${_debrel}_${_debarch}.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"

  rm "${pkgdir}/opt/ladybird/share/Lagom/package-format" # No 'apt update' here.

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
