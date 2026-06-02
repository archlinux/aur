# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=python-ttkbootstrap
_name=${pkgname#python-}
pkgver=1.20.3
pkgrel=1
pkgdesc='Theme extension for tkinter inspired by Bootstrap'
url='https://github.com/israel-dryer/ttkbootstrap'
depends=('python' 'python-pillow' 'tk')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3350b80f79b0454c12558a7174c4bc4bd47905758843c3e8b0fbb19a0286fb69')

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
