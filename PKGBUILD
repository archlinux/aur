# Maintainer: hzmi <contact@hzmi.xyz>
pkgname=circuit-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Declarative, vendor-neutral network configuration"
arch=('x86_64' 'aarch64')
url="https://circuit.tako.id"
license=('BUSL-1.1')
provides=('circuit')
conflicts=('circuit')
depends=('glibc')
# Circuit is one compiled Bun binary: stripping it removes the program it carries.
options=('!strip' '!debug')
# The release's files have no version in their name: keep each version apart in makepkg's cache. The licence is the
# tag's; its checksum stops the update when the licence changes.
source=("circuit-LICENSE-${pkgver}::https://raw.githubusercontent.com/takodotid/circuit/v${pkgver}/LICENSE")
source_x86_64=("circuit-${pkgver}-amd64::https://github.com/takodotid/circuit/releases/download/v${pkgver}/circuit-linux-x64")
source_aarch64=("circuit-${pkgver}-arm64::https://github.com/takodotid/circuit/releases/download/v${pkgver}/circuit-linux-arm64")
sha256sums=('afd812a79bb66d98a9710892edf51a1d69bc12b93c4b2a040d9d5be2ee1d546e')
sha256sums_x86_64=('6341d3702c15365661eaa35b22b4eaf73139b0f3f084110985691895f1544b02')
sha256sums_aarch64=('c22201871747a8799ef8a4c224938a469a2072d6998c234658d7df922176d4f8')

package() {
  install -Dm755 circuit-"${pkgver}"-*64 "${pkgdir}/usr/bin/circuit"
  install -Dm644 "circuit-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # With this file beside it, Circuit leaves its updates and its removal to pacman.
  printf '%s\n' 'yay -Syu circuit-bin' 'sudo pacman -R circuit-bin' |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/circuit/package-manager"
}
