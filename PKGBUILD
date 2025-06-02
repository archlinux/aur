pkgbase='novelwriter'
pkgname=('novelwriter')
_module='novelWriter'
pkgver='2.7'
pkgrel=1
pkgdesc="A markdown-like document editor for writing novels"
url="https://novelwriter.io"
depends=('python' 'python-pyenchant' 'python-lxml' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-svg' 'nuspell')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('GPL')
arch=('any')
source=("https://github.com/vkbo/$_module/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac828a3e9e6ea4ef90fbdcf162c7f179079e9d852eaddcc1d29cac3399c8c83b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/$pkgname-$pkgver-py3-none-any.whl

    install -D setup/data/novelwriter.desktop -t "${pkgdir}"/usr/share/applications
    install -D setup/data/novelwriter.png -t "${pkgdir}"/usr/share/pixmaps
    install -D setup/data/x-novelwriter-project.xml -t "${pkgdir}"/usr/share/mime/packages
    mkdir -p "${pkgdir}"/usr/share/icons/"${pkgname}" && cp -r setup/data/hicolor/* "${pkgdir}"/usr/share/icons/"${pkgname}"

}
