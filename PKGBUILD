pkgname=nettui-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Unified TUI for Wi-Fi and Ethernet"
arch=("x86_64")
url="https://github.com/skibidiandulka/nettui"
license=("GPL-3.0-only")
options=("!debug")
depends=("glibc" "gcc-libs")
conflicts=("nettui" "nettui-git")
source=("nettui-v${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/nettui-v${pkgver}-x86_64.tar.gz")
sha256sums=("5253f38aa48e1f53f1b59505917772c8cfd51126f5f0f094bafc2e2bf98140b5")

package() {
  local srcroot="${srcdir}/nettui-v${pkgver}-x86_64"
  if [[ ! -d "${srcroot}" ]]; then
    srcroot="${srcdir}"
  fi

  if [[ ! -f "${srcroot}/nettui" ]]; then
    echo "nettui binary was not found in release archive" >&2
    return 1
  fi

  install -Dm755 "${srcroot}/nettui" "${pkgdir}/usr/bin/nettui"

  if [[ -f "${srcroot}/README.md" ]]; then
    install -Dm644 "${srcroot}/README.md" "${pkgdir}/usr/share/doc/nettui/README.md"
  fi
  if [[ -f "${srcroot}/LICENSE" ]]; then
    install -Dm644 "${srcroot}/LICENSE" "${pkgdir}/usr/share/licenses/nettui/LICENSE"
  fi
  if [[ -f "${srcroot}/config/keybinds.toml.example" ]]; then
    install -Dm644 "${srcroot}/config/keybinds.toml.example" "${pkgdir}/usr/share/doc/nettui/keybinds.toml.example"
  fi
}
