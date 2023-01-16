# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

_pkgver=1.101.0
_pkgtag=beta
_pkgrel="${_pkgver}-${_pkgtag}"

pkgname="pulsar-bin"
pkgver="${_pkgver}${_pkgtag}"
pkgrel=2
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
source=("pulsar-${pkgver}.deb::$url/releases/download/v${_pkgrel}/Linux.pulsar_${_pkgrel}_amd64.deb")
sha256sums=('d73d3c4a43fa1c86690ad6b13861d0eaf7a436015e327b960e1d821453c3fa39')

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
