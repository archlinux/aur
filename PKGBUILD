# Maintainer: Sirulex <aur.refined792@passmail.com>

_pkgname=cursor-clip
pkgname=${_pkgname}-bin
pkgver=1.0.1
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
  "libadwaita"
)
depends_aarch64=("cairo" "gdk-pixbuf2" "pango")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=("!debug")

source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=(
  "8073da13c90f5c9e67de72b986b4cc0be7f3d36fb07b1331f973cb9d0c79ddf4"
)

source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=(
  "0a7b58725887f4011f84fd27009561f0cba4c6a6379657d8f76d939a4ab77801"
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

  local release_dir="${_pkgname}-v${pkgver}-${target}"

  install -Dm755 "${release_dir}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${release_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${release_dir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
