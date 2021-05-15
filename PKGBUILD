# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-web-compile
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI to compile/minify SCSS & JS, and associated pre-commit hook"
arch=('any')
url="https://github.com/executablebooks/web-compile"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-jinja' 'python-libsass' 'python-gitpython' 'python-yaml' 'python-rjsmin' 'python-toml')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('11eb06c747431fdb7c9becba04bc023c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test || warning "Tests failed"
#   pytest #|| warning "Tests failed"
}

package() {
    depends=('python-click' 'python-jinja' 'python-libsass' 'python-gitpython' 'python-yaml' 'python-rjsmin' 'python-toml')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
