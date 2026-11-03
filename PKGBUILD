# Maintainer: buding <1259085392z@gmail.com>
pkgname=astrbot-desktop-bin
pkgver=4.29.4
pkgrel=1
pkgdesc='AstrBot desktop application (official prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/AstrBotDevs/AstrBot-desktop'
license=('AGPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'gcc-libs' 'glibc')
provides=('astrbot-desktop')
conflicts=('astrbot-desktop')
options=('!strip' '!debug')
# The license is pinned independently of release tags, which may not carry source.
source=('AstrBot-LICENSE::https://raw.githubusercontent.com/AstrBotDevs/AstrBot-desktop/6cf79c322190299f0d83cb2f9001984655fcd88d/LICENSE')
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
source_x86_64=("AstrBot_${pkgver}_linux_amd64.deb::${url}/releases/download/v${pkgver}/AstrBot_${pkgver}_linux_amd64.deb")
sha256sums_x86_64=('51b488aaaa8844bd92c9731558bfb57878624c25a5c8264c3d8af458d499ce05')
source_aarch64=("AstrBot_${pkgver}_linux_arm64.deb::${url}/releases/download/v${pkgver}/AstrBot_${pkgver}_linux_arm64.deb")
sha256sums_aarch64=('13c39b6d8a3cda9a68678cb23baedba357f40da962166c7cb1354312802adc75')
noextract=("AstrBot_${pkgver}_linux_amd64.deb" "AstrBot_${pkgver}_linux_arm64.deb")

package() {
  local debarch
  case "$CARCH" in
    x86_64) debarch=amd64 ;;
    aarch64) debarch=arm64 ;;
    *) return 1 ;;
  esac
  # Stream only the payload; Debian maintainer scripts must never run.
  bsdtar -xOf "$srcdir/AstrBot_${pkgver}_linux_${debarch}.deb" 'data.tar.*' |
    bsdtar -xf - -C "$pkgdir"
  install -Dm644 "$srcdir/AstrBot-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
