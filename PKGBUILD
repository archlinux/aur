# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

# Note: `makepkg --printsrcinfo > .SRCINFO`

pkgname="python-west"
_name=${pkgname##"python-"}
pkgdesc="Zephyr RTOS Project meta-tool"
pkgver=1.5.0
pkgrel=1
arch=("any")
url="https://pypi.org/project/west/"
license=("Apache")
depends=("python>=3.9"
         "python-colorama"
         "python-yaml>=5.1"
         "python-pykwalify"
         "python-packaging")
makedepends=("python-build"
             "python-installer"
             "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('7088fe0e9afe0719ebee95c51c529149f7bcfc919d83a8206d35fa9c683ed0a5')
