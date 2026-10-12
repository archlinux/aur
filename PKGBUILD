# Maintainer: NourEddineX
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2026.10.07.08.29.stable_00
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
sha256sums_x86_64=('c481652795704e8c21a2b6b6ebbd7ebd9390d57f1e9d151af666a28218b6abe6')
sha256sums_aarch64=('b9ef6f032c41ed86d18ec757c7f1efb070ad3a3d9f6bb78737d7e9f14d10a6fb')

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
