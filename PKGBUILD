# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=DPYProxy
pkgname=dpyproxy
pkgver=3.0.2
pkgrel=1
pkgdesc='Python Proxy that implements DPI evasion mechanisms '
arch=('any')
url='https://github.com/UPB-SysSec/DPYProxy'
license=('Apache-2.0')

# https://github.com/UPB-SysSec/DPYProxy/blob/master/pyproject.toml
depends=(
        'python-aioquic'
        'python-anyio'
        'python-cryptography'
        'python-dnspython'
        'python-h2'
        'python-httpx'
        'python-service-identity'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
provides=('python-dpyproxy')
replaces=('python-dpyproxy')
conflicts=('python-dpyproxy')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8e6f1ac5c0faa85a0dead478e991e9ed59216ad04179f659a6435560a157b361')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
        cd ${_pkgname}-${pkgver}
        python -m build --wheel --no-isolation
}

package() {
        cd ${_pkgname}-${pkgver}
        python -m installer --destdir="$pkgdir" dist/*.whl
        install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

