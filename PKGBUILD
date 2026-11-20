# Maintainer: MrTorex <thehardworker@posteo.com>

pkgname=unityhub-beta
_pkgver=4.0.0-beta.5
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unity Hub beta"
arch=('x86_64')
url="https://unity.com/"
license=('LicenseRef-Unity-Terms-of-Service')
depends=(
  'cpio'
  'fontconfig'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'xdg-utils'
)
optdepends=(
  'vulkan-driver: hardware-accelerated Vulkan rendering (e.g. mesa, nvidia-utils)'
  'libxml2-legacy: required by Unity Editor versions prior to 6000.6.3f1'
)
provides=('unityhub')
conflicts=('unityhub')
options=('!strip')
source=(
  "$pkgname-$_pkgver.deb::https://hub-dist.unity3d.com/artifactory/hub-debian-prod-local/pool/main/u/unity/unityhub_amd64/UnityHubSetup-$_pkgver-amd64.deb"
)
sha256sums=(
  '2552f8adefefebb4e6eff532d1394d55b69ba61e1ee11dc0ad49036be2c4f8e0'
)

package() {
  tar -xf "$srcdir/data.tar.zst" -C "$pkgdir/"

  install -Dm644 "$pkgdir/usr/share/doc/unityhub/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf "$pkgdir/usr/share/doc"
}
