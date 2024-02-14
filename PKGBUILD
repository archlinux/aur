# Maintainer: mammo0 <marc.ammon@hotmail.de>
pkgname=owncloud-client-desktop-shell-integration-nautilus
pkgver=5.0.0
pkgrel=1
pkgdesc="A Python extension for Nautilus and its forks Nemo and Caja to provide shell integration for the ownCloud desktop client for the GNOME, Cinnamon and MATE desktop environments."
arch=('any')
url="https://github.com/owncloud/client-desktop-shell-integration-nautilus"
license=('GPL-2.0')
depends=('owncloud-client')
makedepends=('cmake' 'ninja')
source=("https://github.com/owncloud/client-desktop-shell-integration-nautilus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e74882ca5bed1b567b122e99ed57580090affba3e219ac8752d2c7ea3e902bf3')

_archivedir="${pkgname#*-}-${pkgver}"

build() {
    cd "${_archivedir}"

    # from https://github.com/owncloud/client-desktop-shell-integration-nautilus/blob/master/.github/workflows/main.yml
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -G Ninja
}

package() {
	cd "${_archivedir}/build"

    # from https://github.com/owncloud/client-desktop-shell-integration-nautilus/blob/master/.github/workflows/main.yml
	env DESTDIR="${pkgdir}/" ninja install
}
