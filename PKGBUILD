# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Bailey Fox <bfox200012@gmail.com>

pkgname=('python-crccheck')
_module=${pkgname#python-}
pkgver='1.3.1'
pkgrel=1
pkgdesc="Calculation library for CRCs and checksums"
url="https://github.com/MartinScharrer/crccheck"
depends=('python')
makedepends=(python-build python-installer python-setuptools python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/crccheck/crccheck-${pkgver}.tar.gz")
sha256sums=('1544c0110bf0a697d875d4f29dc40d7079f9d4d402a9317383f55f90ca72563a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    ln -s "${site_packages}/${_module}-${pkgver}.dist-info/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
