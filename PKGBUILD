# Maintainer: Melvin Vermeeren <mail@mel.vin>

_name=sphinx-multibuild
pkgname=("python-${_name}")
pkgver=1.2.1
pkgrel=2
pkgdesc="Allow sphinx to build with multiple source directories and watch for changes."
arch=('any')
url="https://github.com/rowanG077/sphinx-multibuild"
license=('MIT')
depends=('python' 'python-watchdog')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
    "LICENSE.TXT")
sha256sums=('88aedb55dbee166e0029b7771a96a602bd2709b2ead69c8eb3d2f4ecf6dc2c87'
            'd5466c93a4bfc35e94a1f088bf531081c4a597481d2515eed45f8d3e8cde95f0')

    build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    cd ..
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
