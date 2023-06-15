# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=deepqt
_module='DeepQt'
pkgver='1.1.7'
pkgrel=1
pkgdesc="Harness the power of the DeepL API with this friendly user interface. Translate plain text and epub files."
url="https://github.com/VoxelCubes/DeepQt"
depends=('python>=3.10.0' 'python-pipx')
makedepends=('python-setuptools' 'python-pip')
license=('GPL')
arch=('any')
source=("https://github.com/VoxelCubes/DeepQt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    # The following line adds /home/user/.local/bin to the PATH
    # If it isn't already there, you will need to log out and back in
    # for the change to take effect.
    # This is because we are installing the package locally, not system-wide,
    # in an isolated environment.
    pipx ensurepath
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    pipx install deepqt==${pkgver}

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "DeepQt.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "media/deepqt.png" "$pkgdir/usr/share/pixmaps/deepqt"
}

