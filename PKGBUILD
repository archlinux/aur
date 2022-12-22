# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Giusy Digital <kurmikon@libero.it>

_pkgver=1.100.0
_pkgtag=beta

pkgname="pulsar-bin"
pkgver="${_pkgver}${_pkgtag}"
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
source=("pulsar-${pkgver}.deb::$url/releases/download/v${_pkgver}-${_pkgtag}/Linux.pulsar_${_pkgver}-${_pkgtag}_amd64.deb")
sha256sums=('a5ee6d068c0b3b5d0aa3feffc8107ef62d44035af22d0373cee89fddb34bd605')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"

  # Cleanup specs. Remove if implemented upstream
  find "$pkgdir/opt/Pulsar/resources/app/ppm" -type d -name "spec" -exec rm -rf {} +
  find "$pkgdir/opt/Pulsar/resources/app.asar.unpacked" -type d -name "spec" -exec rm -rf {} +

  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$pkgdir/opt/Pulsar/resources/pulsar.sh"

  ln -sf "/opt/Pulsar/resources/pulsar.sh" "$pkgdir/usr/bin/pulsar"
}
