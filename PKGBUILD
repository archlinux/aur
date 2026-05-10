# Maintainer: Carlos Prieto <prietus@live.com>
pkgname=mopyrust-bin
_pkgname=mopyrust
pkgver=0.1.0
pkgrel=1
pkgdesc="Native Mopidy client for desktop, written in Rust + Tauri + Svelte (prebuilt binary)"
arch=('x86_64')
url="https://github.com/prietus/mopyrust"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'gcc-libs'
  'glibc'
)
optdepends=('mopidy: server this client connects to')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('bde5bedb76bbf5d57848777ac265d6b224fd99169f1b477e310989183d55c502')

package() {
  cd "${srcdir}"
  bsdtar -xf "${_pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"

  # Tauri's .deb installs to /usr — that's already correct for Arch.
  install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
