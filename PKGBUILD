# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
pkgver=1.4.0
pkgrel=1
pkgdesc="Meta-package for glue and plugin packages"
arch=('any')
url="http://glueviz.org"
license=('BSD')
depends=('python-glue-core>=1.13.0'
         'python-scikit-image'
         'python-pyavm'
         'python-astrodendro'
         'python-spectral-cube'
         'python-pillow>7.1.0'
         'python-glue-qt>=0.1.0'
         'python-glue-vispy-viewers>=1.0.3')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
optdepends=('glueviz-doc: Documentation for Glueviz')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d3a6d2c845028ba8230bbc6130e09058206f4d6ad647b774a8f38f88ab6e53fc')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

