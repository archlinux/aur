pkgbase='novelwriter'
pkgname=('novelwriter')
_module='novelWriter'
pkgver='2.6'
pkgrel=1
pkgdesc="A markdown-like document editor for writing novels"
url="https://novelwriter.io"
depends=('python' 'python-pyenchant' 'python-lxml' 'python-pyqt5' 'python-pyqt5-webengine' 'qt5-svg' 'nuspell')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('GPL')
arch=('any')
source=("https://github.com/vkbo/$_module/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6bde7fb0ed11d0fec0e99a0f7fd2fc92390da5c1da7c9d4ee67c67cf24d62c4c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/$_module-$pkgver-py3-none-any.whl

    install -D setup/data/novelwriter.desktop -t "${pkgdir}"/usr/share/applications
    install -D setup/data/novelwriter.png -t "${pkgdir}"/usr/share/pixmaps
    install -D setup/data/x-novelwriter-project.xml -t "${pkgdir}"/usr/share/mime/packages
    mkdir -p "${pkgdir}"/usr/share/icons/"${pkgname}" && cp -r setup/data/hicolor/* "${pkgdir}"/usr/share/icons/"${pkgname}"

}
