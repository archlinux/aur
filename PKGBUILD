# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=deepqt
_module='DeepQt'
pkgver='1.1.6'
pkgrel=1
pkgdesc="Harness the power of the DeepL API with this friendly user interface. Translate plain text and epub files."
url="https://github.com/VoxelCubes/DeepQt"
depends=('python>=3.10.0' 'pyside6')
makedepends=('python-setuptools' 'python-pip')
license=('GPL')
arch=('any')
source=("https://github.com/VoxelCubes/DeepQt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    pip install -r requirements.txt
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "DeepQt.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "media/deepqt.png" "$pkgdir/usr/share/pixmaps/deepqt.png"
}

