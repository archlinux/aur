# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=rive-cli-bin
pkgver=1.8.0
pkgrel=1
pkgdesc='Command-line tools for creating, previewing, and publishing Rive graphics'
arch=('x86_64')
url='https://rive.app/'
license=('LicenseRef-unknown')
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
  'zlib'
  'libglvnd'
  'libx11'
  'wayland'
  'libxkbcommon'
)
optdepends=('xdg-utils: open browser links for authentication')
provides=("rive-cli=${pkgver}")
conflicts=('rive-cli')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-linux-x64.tar.gz::https://releases.rive.app/cli/v${pkgver}/rive-linux-x64.tar.gz")
sha256sums=('9d67bdb77e33db2daa7ce80df51579212ff0cf55a9d6ae3696e4608a248847af')

package() {
  cd "${srcdir}"

  # Rive looks for docs/ and samples/ beside its executable.
  install -Dm755 rive "${pkgdir}/opt/rive-cli/rive"
  cp -a docs samples "${pkgdir}/opt/rive-cli/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/rive-cli/rive "${pkgdir}/usr/bin/rive"
}
