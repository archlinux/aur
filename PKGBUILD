# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-mkdocs-git-revision-date-localized-plugin
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.7.2
pkgrel=1
pkgdesc="MkDocs plugin to add a last updated date to your site pages "
arch=('i686' 'x86_64')
url="https://github.com/timvink/mkdocs-git-revision-date-localized-plugin"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('mkdocs>=1.0' 'python-gitpython' 'python-babel>=2.7.0')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/timvink/mkdocs-git-revision-date-localized-plugin/master/LICENSE")
md5sums=('fbd7eb7c11b662f7d2c4981a747cf336'
         'SKIP')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    depends=('python>=3.5' 'mkdocs>=1.0' 'python-gitpython' 'python-babel>=2.7.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
