# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-mkdocs-git-revision-date-localized-plugin
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.9
pkgrel=1
pkgdesc="MkDocs plugin to add a last updated date to your site pages "
arch=('i686' 'x86_64')
url="https://github.com/timvink/mkdocs-git-revision-date-localized-plugin"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('mkdocs>=1.0' 'python-gitpython' 'python-babel>=2.7.0')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/timvink/mkdocs-git-revision-date-localized-plugin/master/LICENSE"
        'fix_setupy_deps.patch')
md5sums=('035623e753727038722972f4f881b7e0'
         'a4104c36644b683e910d1560dca5b99f'
         '71b47e261d985860be764b5110d5c7a3')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_setupy_deps.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    depends=('python>=3.6' 'mkdocs>=1.0' 'python-gitpython' 'python-babel>=2.7.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
