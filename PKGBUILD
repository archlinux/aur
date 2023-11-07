# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=panelcleaner
_module='PanelCleaner'
pkgver='2.1.2'
_pypi_pkgver='2.1.0'
pkgrel=1
pkgdesc="An AI-powered tool to clean manga panels. Provides both a CLI (pcleaner) and GUI (Qt-based)"
url="https://github.com/VoxelCubes/PanelCleaner"
depends=('python>=3.10.0' 'python-pipx')
makedepends=('python-setuptools' 'python-pip')
license=('GPL')
arch=('any')
source=("https://github.com/VoxelCubes/PanelCleaner/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('pcleaner' 'pcleaner-gui')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    # The following line adds /home/user/.local/bin to the PATH
    # If it isn't already there, you will need to log out and back in
    # for the change to take effect.
    # This is because we are installing the package locally, not system-wide,
    # in an isolated environment.
    # Check if ~/.local/bin is in PATH
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo 'Ensuring that ~/.local/bin is in PATH, due to pipx installing locally, in an isolated environment.'
        echo 'If you did not have this in your PATH before, you will need to log out and back in after installation.'
    fi
    # Perform the ensurance either way, to be on the safe side.
    pipx ensurepath
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    pipx install pcleaner==${_pypi_pkgver}

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "PanelCleaner.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "icons/logo.png" "$pkgdir/usr/share/pixmaps/panelcleaner.png"
}

