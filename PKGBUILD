# Maintainer: Anthony Wang <a_at-exozy_dot-me>

_name='simpervisor'
pkgname="python-$_name"
pkgver='1.0.0'
pkgrel=1
pkgdesc="Simple async process supervisor"
url="https://github.com/yuvipanda/simpervisor"
depends=(python)
makedepends=(python-build python-installer python-hatch-jupyter-builder)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7eb87ca86d5e276976f5bb0290975a05d452c6a7b7f58062daea7d8369c823c1')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
