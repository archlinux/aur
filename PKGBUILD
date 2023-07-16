# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

pkgname="pulsar-bin"
pkgver=1.107.1
pkgrel=1
pkgdesc="A community-led hyper-hackable text editor, built on electron"
arch=("x86_64")
url="https://github.com/pulsar-edit/pulsar"
license=("MIT")
depends=("libxkbfile" "ripgrep")
optdepends=(
  "ctags: symbol indexing support"
  "git: Git and GitHub integration"
  "hunspell: spell check integration"
)
provides=("pulsar")
conflicts=("pulsar")
source=("pulsar-${pkgver}.deb::$url/releases/download/v${pkgver}/Linux.pulsar_${pkgver}_amd64.deb")
sha256sums=('e61ed1f3cef77c92856efec0f04bcab7b9a6c27ac3c9912ff97770b07552c78b')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  # Cleanup specs. Remove if implemented upstream
  find "$pkgdir/opt/Pulsar/resources/app/ppm" -type d -name "spec" -exec rm -rf {} +
  find "$pkgdir/opt/Pulsar/resources/app.asar.unpacked" -type d -name "spec" -exec rm -rf {} +

  mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cp "$pkgdir/opt/Pulsar/resources/pulsar.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pulsar.svg"

  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$pkgdir/opt/Pulsar/resources/pulsar.sh"

  ln -sf "/opt/Pulsar/resources/pulsar.sh" "$pkgdir/usr/bin/pulsar"
}
