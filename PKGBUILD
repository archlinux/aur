# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=python-ttkbootstrap
_name=${pkgname#python-}
pkgver=1.14.0
pkgrel=1
pkgdesc='Theme extension for tkinter inspired by Bootstrap'
url='https://github.com/israel-dryer/ttkbootstrap'
depends=('python' 'python-pillow' 'tk')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('17fe56c73d79545bda2aa552338962530b35be4f4241242a36813af2be8c2030')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
