# Maintainer: robertfoster
pkgname=openrig-bin
pkgver=0.14.2 # renovate: datasource=github-releases depName=Siryu6/OpenRig
pkgrel=1
pkgdesc="Open-source guitar multi-effects pedalboard: NAM, LV2 and impulse responses"
arch=(x86_64 aarch64)
url="https://github.com/Siryu6/OpenRig"
license=(GPL-3.0-or-later)
depends=(alsa-lib fontconfig glibc hicolor-icon-theme libgcc libstdc++ lilv serd
  libglvnd libx11 libxcb libxcursor libxi libxkbcommon libxkbcommon-x11 libxrender wayland)
optdepends=('jack: JACK audio backend')
provides=(openrig)
conflicts=(openrig)
source=("openrig-${pkgver}.svg::https://raw.githubusercontent.com/Siryu6/OpenRig/v${pkgver}/os/board/common/splash/splash.svg"
  openrig.desktop)
source_x86_64=("${url}/releases/download/v${pkgver}/openrig-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/openrig-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('7b681e71a25f758d295065fac871f1383e260105ddf8d49cefc5dfbb4497da8a'
            'cfc443010569356a4059993d93ffde9c6043d96afeddbab733338e3bcb5f5f75')
sha256sums_x86_64=('9a1800b4e863d8b1875fd2e145a7a51154a4c108e687ce4e9cfd08255c0bf4aa')
sha256sums_aarch64=('69558bf3f7684e08d45547cb1e2812cb15591fd188d00047be5987f2d1a37cfd')

prepare() {
  # Crop the boot logo to the pedal glyph for a square app icon
  sed 's|width="560" height="300" viewBox="0 0 560 300"|width="256" height="256" viewBox="190 4 180 180"|' \
    "openrig-${pkgver}.svg" > openrig.svg
}

package() {
  install -Dm644 openrig.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openrig.svg"
  install -Dm644 openrig.desktop -t "${pkgdir}/usr/share/applications"

  cd "openrig-${pkgver}-linux-${CARCH}"
  install -Dm755 pedalboard "${pkgdir}/usr/bin/openrig"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
