# Maintainer: Igor Kalicinski <igorkalicinski@gmail.com>
# Updated by .github/workflows/release.yml: pkgver and sha256sums are filled in per release.
pkgname=openmasterhub-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Service and desktop app for the Cooler Master MasterHUB modular controller"
arch=('x86_64')
url="https://github.com/hoxton314/openmasterhub"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glibc' 'gcc-libs' 'systemd')
optdepends=(
  'wireplumber: volume widget and volume actions (wpctl)'
  'nvidia-utils: NVIDIA GPU usage/temperature widgets'
  'curl: cover art for the now-playing widget'
  'hyprland: switch profiles by focused application'
)
provides=('openmasterhub')
conflicts=('openmasterhub' 'openmasterhub-git')
install=openmasterhub.install
source=("openmasterhub-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/openmasterhub-${pkgver}-x86_64.tar.gz")
sha256sums=('fc790f2c3f308e14bc4222d523c488f1ad816db5be5af4adc90a3aba6948874f')

package() {
  cd "openmasterhub-${pkgver}-x86_64"
  install -Dm755 masterhubd "$pkgdir/usr/bin/masterhubd"
  install -Dm755 openmasterhub "$pkgdir/usr/bin/openmasterhub"
  install -Dm644 70-masterhub.rules "$pkgdir/usr/lib/udev/rules.d/70-masterhub.rules"
  install -Dm644 masterhubd.service "$pkgdir/usr/lib/systemd/user/masterhubd.service"
  install -Dm644 org.openmasterhub.OpenMasterHub.desktop "$pkgdir/usr/share/applications/org.openmasterhub.OpenMasterHub.desktop"
  for size in 32 64 128 256 512; do
    install -Dm644 "icons/${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/openmasterhub.png"
  done
  install -Dm644 config.toml "$pkgdir/usr/share/doc/openmasterhub/config.example.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/openmasterhub/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
