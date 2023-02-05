# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

pkgname=python-gymnasium
_name=${pkgname#python-}
pkgver=0.27.1
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="A standard API for single-agent reinforcement learning environments, with popular reference environments and related utilities (formerly Gym)"
arch=('any')
url="https://gymnasium.farama.org/"
license=('MIT')
depends=('python-numpy' 'python-jax-jumpy' 'python-cloudpickle' 'python-importlib-metadata' 'python-typing_extensions' 'python-gymnasium-notices')
#optdepends=('python-ale-py' 'python-pillow' 'python-opengl')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz" "LICENSE-${pkgver}::https://raw.githubusercontent.com/Farama-Foundation/Gymnasium/${_pkgver}/LICENSE")
b2sums=('76833e45d9c9ffc195b8513f75fd9d68500d385ae5f164f3c3cc76e13b30d422b3bc59e1077621b98278fb13adcf982779708908a7259a08fda8d217d5756269'
        'b6db99ea6c9ea0e273bcd814720a0932ea5bac664517f724a8d0c5a7b15cfb03e4a54622965ef746a725728c44e8c31713f0445500d1fe4e03ba1ff740e116b5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ${srcdir}/LICENSE-${pkgver} "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
