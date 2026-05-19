# Maintainer: NourEddineX
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2026.05.18.05.32.stable_02
pkgrel=1
pkgdesc="Warp is the intelligent terminal with AI and your dev team's knowledge built-in."
arch=('x86_64' 'aarch64')
url="https://warp.dev"
license=('custom:WARP')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'libxcb' 'libxkbcommon-x11')
source=("LICENSE.txt")
source_x86_64=("${_pkgname}-v${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://releases.warp.dev/stable/v${pkgver}/${_pkgname}-v${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("${_pkgname}-v${pkgver}-${pkgrel}-aarch64.pkg.tar.zst::https://releases.warp.dev/stable/v${pkgver}/${_pkgname}-v${pkgver}-${pkgrel}-aarch64.pkg.tar.zst")

sha256sums=('e63485e6dff24dd507ff0caa59eace7cf899f4986d8ddd0c8a53389d6ecd3280')
sha256sums_x86_64=('d98d48865723a227e0c47720ee4096d0d16d69f2a1613d9c18782d7926f57325')
sha256sums_aarch64=('0da328a3155b5ccdfb840d7455fda52e2773efc1e25dc07b1e19ce2945b6c2ee')

package() {
  mkdir -p "$srcdir/extracted"
  bsdtar -xf "${srcdir}/${_pkgname}-v${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst" -C "$srcdir/extracted"

  cp -a "$srcdir/extracted/"* "$pkgdir/"

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  if [ -f "${pkgdir}/usr/bin/warp" ] && [ ! -f "${pkgdir}/usr/bin/warp-terminal" ]; then
    ln -sf "/usr/bin/warp" "${pkgdir}/usr/bin/warp-terminal"
  elif [ -f "${pkgdir}/opt/warp/warp" ] && [ ! -f "${pkgdir}/usr/bin/warp-terminal" ]; then
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/warp/warp" "${pkgdir}/usr/bin/warp-terminal"
  fi
}
