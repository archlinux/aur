# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=bottles-opener
pkgver=0.1.1
pkgrel=1
pkgdesc="Double-click a file and it opens in its Windows program, inside its Bottles bottle"
arch=('any')
url="https://github.com/LoonixTools/bottles-opener"
license=('GPL-3.0-or-later')
depends=('bash' 'coreutils' 'gawk' 'grep' 'sed' 'gettext' 'shared-mime-info' 'systemd')
makedepends=('gettext' 'scdoc')
optdepends=('bottles: Bottles itself (the Flatpak works too)'
            'python-yaml: read bottles without starting the Bottles Flatpak'
            'icoextract: extract file icons without starting the Bottles Flatpak'
            'libnotify: report files that could not be opened'
            'desktop-file-utils: refresh the desktop database after a change'
            'flatpak: open files with the Bottles Flatpak')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8289f0941d9355993f4912bb69aea2fd916c1ba706ee15e497459de296bd639')

build() {
  # pass the version being packaged so `bottles-opener --version` cannot drift
  # away from pkgver
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver"
}

package() {
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver" DESTDIR="$pkgdir" install
}
