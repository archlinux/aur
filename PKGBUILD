# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=mopyrust-bin
_pkgname=mopyrust
pkgver=0.1.8
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
sha256sums=('7bbb40a48aee8384a223b5859115c54abb44cedd86729150509507cc3191512e')

package() {
  cd "${srcdir}"
  bsdtar -xf "${_pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"

  # Tauri's .deb installs to /usr — that's already correct for Arch.
  install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
