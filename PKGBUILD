# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

pkgname="pulsar-bin"
pkgver=1.129.0
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
sha256sums=('41e52407daa5cc54288b2a781467e88b5288afa797da297e6b73465582104adf')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  # Cleanup specs. Remove if implemented upstream
  find "$pkgdir/opt/Pulsar/resources/app/ppm" -type d -name "spec" -exec rm -rf {} +
  find "$pkgdir/opt/Pulsar/resources/app.asar.unpacked" -type d -name "spec" -exec rm -rf {} +

  install -Dm644 "$pkgdir/opt/Pulsar/resources/pulsar.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  install -Dm755 -d "$pkgdir/usr/bin"
  chmod +x "$pkgdir/opt/Pulsar/resources/pulsar.sh"

  ln -sf "/opt/Pulsar/resources/pulsar.sh" "$pkgdir/usr/bin/pulsar"
}
