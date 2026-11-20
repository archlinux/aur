# Maintainer: Sirulex <aur.refined792@passmail.com>

_pkgname=cursor-clip
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="GTK4/Libadwaita Wayland clipboard manager with dynamic cursor-positioned overlay (prebuilt binary)"
arch=("x86_64" "aarch64")
url="https://github.com/Sirulex/cursor-clip"
license=("GPL-3.0-only")
depends=(
  "dbus"
  "gcc-libs"
  "glib2"
  "glibc"
  "gtk4"
  "gtk4-layer-shell"
  "libadwaita>=1.5"
)
depends_aarch64=("cairo" "gdk-pixbuf2" "pango")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=("!debug")

source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=(
  "8f468a9cb3e7501707878e27816674835cfb551f9e4894ce3ebb1f9d414d4a6a"
)

source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=(
  "98641baa92dbc0ebcccf680f7c314eb38a0791e5a60e870462cfc7efc5694a8e"
)

package() {
  local target
  case "${CARCH}" in
    x86_64)
      target="x86_64-unknown-linux-gnu"
      ;;
    aarch64)
      target="aarch64-unknown-linux-gnu"
      ;;
  esac

  local release_dir="${srcdir}/${_pkgname}-v${pkgver}-${target}"

  install -Dm755 "${release_dir}/${_pkgname}-daemon" \
    "${pkgdir}/usr/bin/${_pkgname}-daemon"
  install -Dm755 "${release_dir}/${_pkgname}-toggle" \
    "${pkgdir}/usr/bin/${_pkgname}-toggle"
  install -Dm644 "${release_dir}/assets/io.github.sirulex.cursor-clip.desktop" \
    "${pkgdir}/usr/share/applications/io.github.sirulex.cursor-clip.desktop"
  install -Dm644 "${release_dir}/assets/io.github.sirulex.cursor-clip.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.sirulex.cursor-clip.svg"
  install -Dm644 "${release_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${release_dir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
