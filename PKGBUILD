# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=python-ttkbootstrap
_name=${pkgname#python-}
pkgver=1.19.2
pkgrel=1
pkgdesc='Theme extension for tkinter inspired by Bootstrap'
url='https://github.com/israel-dryer/ttkbootstrap'
depends=('python' 'python-pillow' 'tk')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c557e3b0bcc0cdb9474433721323ec645a04255325fd7247bb65425491815a6e')

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
