# Maintainer: Igor Kalicinski <igorkalicinski@gmail.com>
# Updated by .github/workflows/release.yml: pkgver and sha256sums are filled in per release.
pkgname=openmasterhub-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux service and GTK4 app for the Cooler Master MasterHUB modular controller"
arch=('x86_64')
url="https://github.com/hoxton314/openmasterhub"
license=('MIT')
depends=('gtk4' 'libadwaita' 'glibc' 'gcc-libs' 'systemd')
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
sha256sums=('83ef40f8b193c537e87729142a914869b396fde8547d8722476b8aad09ad1939')

package() {
  cd "openmasterhub-${pkgver}-x86_64"
  install -Dm755 masterhubd "$pkgdir/usr/bin/masterhubd"
  install -Dm755 openmasterhub "$pkgdir/usr/bin/openmasterhub"
  install -Dm644 70-masterhub.rules "$pkgdir/usr/lib/udev/rules.d/70-masterhub.rules"
  install -Dm644 masterhubd.service "$pkgdir/usr/lib/systemd/user/masterhubd.service"
  install -Dm644 org.openmasterhub.OpenMasterHub.desktop "$pkgdir/usr/share/applications/org.openmasterhub.OpenMasterHub.desktop"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/openmasterhub/config.example.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/openmasterhub/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
