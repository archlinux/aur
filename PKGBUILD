# Maintainer: PIWI <ton-email@domain.com>
pkgname=omarchy-exegol-vm
pkgver=0.1.1
pkgrel=1
pkgdesc='Encrypted Exegol offensive-security VM for Omarchy (Ubuntu + Docker + Exegol, triple-layer LUKS)'
arch=('any')
url='https://github.com/PIWI10/omarchy-exegol-vm'
license=('MIT')
depends=(
  'bash'
  'coreutils'
  'cryptsetup'
  'curl'
  'docker'
  'gum'
  'libnotify'
  'sudo'
  'virt-viewer'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b512333ab50178a1b3cd6c3eabfe71e6f41c1b62901ca98af7dc653cf9729d2')

package() {
  cd "${pkgname}-${pkgver}"

  # Binaries
  install -Dm755 bin/omarchy-exegol-vm          "${pkgdir}/usr/bin/omarchy-exegol-vm"
  install -Dm755 bin/omarchy-exegol-vm-integrate-os   "${pkgdir}/usr/bin/omarchy-exegol-vm-integrate-os"
  install -Dm755 bin/omarchy-exegol-vm-unintegrate-os "${pkgdir}/usr/bin/omarchy-exegol-vm-unintegrate-os"

  # Scripts
  install -Dm755 scripts/install.sh             "${pkgdir}/usr/share/${pkgname}/scripts/install.sh"
  install -Dm755 scripts/luks-setup.sh          "${pkgdir}/usr/share/${pkgname}/scripts/luks-setup.sh"
  install -Dm755 scripts/workspace-mount.sh     "${pkgdir}/usr/share/${pkgname}/scripts/workspace-mount.sh"
  install -Dm644 scripts/compose.yml.tmpl       "${pkgdir}/usr/share/${pkgname}/scripts/compose.yml.tmpl"
  install -Dm644 scripts/cloud-init/meta-data   "${pkgdir}/usr/share/${pkgname}/scripts/cloud-init/meta-data"
  install -Dm644 scripts/cloud-init/user-data.tmpl "${pkgdir}/usr/share/${pkgname}/scripts/cloud-init/user-data.tmpl"

  # Omarchy integration snippets
  install -Dm644 share/omarchy-menu.sh          "${pkgdir}/usr/share/${pkgname}/omarchy-menu.sh"
  install -Dm644 share/hypr/omarchy-exegol-vm.conf "${pkgdir}/usr/share/${pkgname}/hypr/omarchy-exegol-vm.conf"

  # Icon
  install -Dm644 assets/icons/exegol.png        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  # Documentation
  install -Dm644 README.md                      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/security.md               "${pkgdir}/usr/share/doc/${pkgname}/security.md"
  install -Dm644 docs/cleanup.md                "${pkgdir}/usr/share/doc/${pkgname}/cleanup.md"
  install -Dm644 docs/integration.md            "${pkgdir}/usr/share/doc/${pkgname}/integration.md"

  # License
  install -Dm644 LICENSE                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
