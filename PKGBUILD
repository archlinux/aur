# Maintainer: pjvm <pjvm742@disroot.org>
# Contributor: Ghassan Alduraibi <git@ghassan.dev>
# Maintainer: crl <crl18039102576@126.com>

pkgname=python-gymnasium
_name=${pkgname#python-}
pkgver=1.2.2
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="A standard API for single-agent reinforcement learning environments, with popular reference environments and related utilities (formerly Gym)"
arch=('any')
url="https://gymnasium.farama.org/"
license=('MIT')
depends=('python-numpy' 'python-cloudpickle' 'python-importlib-metadata' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-pygame: environment rendering, required for many provided environments'
            'python-pybox2d: required for box2d environments'
            'box2d: required for box2d environments'
            'python-mujoco: required for mujoco environments'
            'python-imageio: required for mujoco environments')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Farama-Foundation/Gymnasium/${_pkgver}/LICENSE")
sha256sums=('46d927328f8518bb5a689dbe270d228c1da2b08bcb71ae0152c10aa66f48d530'
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
