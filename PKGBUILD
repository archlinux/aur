# Maintainer: NourEddineX
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2026.06.03.09.49.stable_03
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
sha256sums_x86_64=('735da7280fa954179bc763efcae96d96552bea1eadfd4e102dc2a9c05a06f4ee')
sha256sums_aarch64=('d88cad7950f366a16c2cac3423ac9ee76f5760e850026d2b6ef84780b3caa2d7')

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
