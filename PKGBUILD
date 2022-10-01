pkgbase='novelwriter'
pkgname=('novelwriter')
_module='novelWriter'
pkgver='1.6.4'
pkgrel=1
pkgdesc="A markdown-like document editor for writing novels"
url="https://novelwriter.io"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('bb4ce82d496a67bb0c65ddad917e3a34604e270807dd41220409a0fd729c7657')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -D setup/data/novelwriter.desktop -t "${pkgdir}"/usr/share/applications
    install -D setup/data/novelwriter.png -t "${pkgdir}"/usr/share/pixmaps
    install -D setup/data/x-novelwriter-project.xml -t "${pkgdir}"/usr/share/mime/packages
    mkdir -p "${pkgdir}"/usr/share/icons/"${pkgname}" && cp -r setup/data/hicolor/* "${pkgdir}"/usr/share/icons/"${pkgname}"

}
