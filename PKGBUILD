# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://git.felo.gg/Felitendo/PKGBUILDS

pkgname=bottles-opener
pkgver=0.1.1
pkgrel=1
pkgdesc="Double-click a file and it opens in its Windows program, inside its Bottles bottle"
arch=('any')
url="https://git.felo.gg/LoonixTools/bottles-opener"
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3ec601cd59006e72d3b4c1d20b8967aad77b7baf20525d8ff53a7ae4f4822bd9')

build() {
  # pass the version being packaged so `bottles-opener --version` cannot drift
  # away from pkgver
  make -C "${pkgname}" VERSION="$pkgver"
}

package() {
  make -C "${pkgname}" VERSION="$pkgver" DESTDIR="$pkgdir" install
}
