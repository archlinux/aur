# Maintainer: Sirulex <aur.refined792@passmail.com>

_pkgname=cursor-clip
pkgname=${_pkgname}-bin
pkgver=1.0.3
pkgrel=2
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
  "d49d73ce66253aaa758c767b1ce8c7211a0c3744f72b955b2c06fd50cb1ecc45"
)

source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=(
  "53d74fe2c6544d09f9ba500ae7fe546b0c015c61a73f99301c8f159088e00e45"
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

  install -Dm755 "${release_dir}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
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
