# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-mkdocs-minify-plugin
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.1
pkgrel=1
pkgdesc="An MkDocs plugin to minify HTML and/or JS files prior to being written to disk"
arch=('i686' 'x86_64')
url="https://github.com/byrnereese/mkdocs-minify-plugin"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('mkdocs>=1.0.4' 'python-htmlmin>=0.1.4' 'python-jsmin>=2.2.2')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('fbc2495b758a32b5cb60e6935a561b93')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    depends=('python>=3.4' 'mkdocs>=1.0.4' 'python-htmlmin>=0.1.4' 'python-jsmin>=2.2.2')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
