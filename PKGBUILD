# Maintainer: Olivia Mackintosh <liv@base.nu>

pkgname='python-marklas'
_module='marklas'
_src_folder='marklas-0.8.0'
pkgver='0.8.0'
pkgrel=1
pkgdesc="Bidirectional converter between GitHub Flavored Markdown and Atlassian Document Format"
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/d3/82/4e08ee4f5db77c96dc53c892d254509bf8b62cd0b9f5aabc1a390b61b708/marklas-0.8.0.tar.gz")
sha256sums=('d2f75d1077be269156fe970795a77e8420b9738bc1bf24fd0e3c416057abc784')

prepare() {
    cd "${srcdir}/${_src_folder}"
    patch pyproject.toml < ../../0001-remove-uv-build-upper-bound.patch
}

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
