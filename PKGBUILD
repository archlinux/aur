# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Initially created with pip2arch: https://github.com/lclarkmichalek/pip2arch
pkgbase='python-b4'
pkgname=('python-b4')
_module='b4'
pkgver='0.5.1'
pkgrel=2
pkgdesc="A tool to work with public-inbox and patch archives"
url="https://git.kernel.org/pub/scm/utils/b4/b4.git"
depends=('python')
makedepends=('python-setuptools' 'python-docutils')
license=('GPL2')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7f13f2239dd942f2d14f6edf4bc9139dd0c03b6f705af00cb10abc9007eccb15')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    rst2man man/b4.5.rst b4.5
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" COPYING
    install -Dm644 -t "${pkgdir}/usr/share/man/man5/" b4.5
}
