# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=html5-parser
pkgbase='python-html5-parser'
pkgname=('python-html5-parser' 'python2-html5-parser')
pkgver=0.4.1
pkgrel=1
pkgdesc="Fast C based HTML 5 parsing for python"
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/${_pkgname}"
license=('Apache')
makedepends=('python-chardet' 'python-lxml' 'python-setuptools'
             'python2-chardet' 'python2-lxml' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('c23323ad5d326859fd4e860afe51e4b5460e5b1ad68e4a12e6de3522f4b214e3'
            'SKIP')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py build
    python2 setup.py build
}

package_python-html5-parser() {
    depends=('python-chardet' 'python-lxml')
    optdepends=('python-beautifulsoup4: to use the soup treebuilder')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-html5-parser() {
    depends=('python2-chardet' 'python2-lxml')
    optdepends=('python2-beautifulsoup4: to use the soup treebuilder')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
