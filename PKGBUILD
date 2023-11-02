# Maintainer: pjvm <pjvm742@disroot.org>
# Contributor: Ghassan Alduraibi <git@ghassan.dev>

pkgname=python-gymnasium
_name=${pkgname#python-}
pkgver=0.29.1
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="A standard API for single-agent reinforcement learning environments, with popular reference environments and related utilities (formerly Gym)"
arch=('any')
url="https://gymnasium.farama.org/"
license=('MIT')
depends=('python-numpy' 'python-cloudpickle' 'python-importlib-metadata' 'python-typing_extensions' 'python-farama-notifications')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz" "LICENSE-${pkgver}::https://raw.githubusercontent.com/Farama-Foundation/Gymnasium/${_pkgver}/LICENSE")
sha256sums=('1a532752efcb7590478b1cc7aa04f608eb7a2fdad5570cd217b66b6a35274bb1' # from PyPI
            '7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ${srcdir}/LICENSE-${pkgver} "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
