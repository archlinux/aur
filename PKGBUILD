# Maintainer: bruceutut
pkgname=python-aionowplaying
_module=aionowplaying
pkgver=0.11.3
pkgrel=1
_src_folder="aionowplaying-$pkgver"
pkgdesc="A cross-platform Now Playing client"
url="https://github.com/BruceZhang1993/aionowplaying"
depends=('python-dbus-fast')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
license=('GPL-3.0-or-later')
arch=('any')
source=("https://files.pythonhosted.org/packages/63/9e/641e20fdaee6aa26209d0ca8eb722075043194bd97e78e391a84b5f5d25c/aionowplaying-$pkgver.tar.gz")
sha256sums=('6fd0a4a470b2f3b8602a0a1afcf2e09addf2bd485233ab8fe939146be69104a0')

build() {
    cd "${srcdir}/${_src_folder}"
    sed -i 's/^requires = .*/requires = ["uv_build"]/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
