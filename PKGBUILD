# Maintainer: coleisforrobot <coleisforrobot at proton dot me>
pkgname=wiilink-patcher-cli-bin
pkgver=2.1.3
_pkgverstrip="${pkgver//./}"
pkgrel=1
pkgdesc="Legacy .NET CLI to patch WiiLink servers into WiiConnect24 channels (pre-compiled)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/WiiLink24/WiiLink24-Patcher"
license=('MPL-2.0')
options=('!strip' '!debug')
depends=('glibc' 'gcc-libs')
provides=("wiilink-patcher-cli=${pkgver}")
conflicts=('wiilink-patcher-cli')

source_x86_64=("WiiLinkPatcher_Linux-x64_v${_pkgverstrip}::https://github.com/WiiLink24/WiiLink24-Patcher/releases/download/v${pkgver}/WiiLinkPatcher_Linux-x64_v${_pkgverstrip}")
source_aarch64=("WiiLinkPatcher_Linux-ARM64_v${_pkgverstrip}::https://github.com/WiiLink24/WiiLink24-Patcher/releases/download/v${pkgver}/WiiLinkPatcher_Linux-ARM64_v${_pkgverstrip}")
source_armv7h=("WiiLinkPatcher_Linux-ARM32_v${_pkgverstrip}::https://github.com/WiiLink24/WiiLink24-Patcher/releases/download/v${pkgver}/WiiLinkPatcher_Linux-ARM32_v${_pkgverstrip}")

sha256sums_x86_64=('d8558e650182076a45497f7ea34477db53c7d016bf2efaa058f4143c674a4ea3')
sha256sums_aarch64=('75547f00505188a350d0f75bac883d602db88b288b771b0faac5ea1037d04876')
sha256sums_armv7h=('8d111e1f32d25af5f275b08c3ba6c339dfa19b41a6e3e40ac77ddc9819005cff')

package() {
  local _bin_arch

  case "$CARCH" in
    x86_64)  _bin_arch="x64" ;;
    aarch64) _bin_arch="ARM64" ;;
    armv7h)  _bin_arch="ARM32" ;;
  esac

  install -Dm755 "${srcdir}/WiiLinkPatcher_Linux-${_bin_arch}_v${_pkgverstrip}" "${pkgdir}/usr/bin/wiilink-patcher-cli"
  ln -s wiilink-patcher-cli "${pkgdir}/usr/bin/WiiLinkPatcher"
}
