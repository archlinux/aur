# Maintainer: Sirulex <aur.refined792@passmail.com>

_pkgname=cursor-clip
pkgname=${_pkgname}-bin
pkgver=1.0.2
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
  "c806453b43c8a58fa13aae3df19418be45904158d2507649382f8cb15a5bfb76"
)

source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=(
  "91453c11813034b9e04074af0eb42995c7e8760f598bd1911fe5737653b1c6fd"
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
