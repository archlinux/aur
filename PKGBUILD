# Maintainer: Daniel Seichter <https://github.com/dseichter>
pkgname=workdir
pkgver=2026.03.16.beta5
pkgrel=1
pkgdesc="Work with multiple directories and run commands without navigating manually."
arch=('any')
url="https://github.com/dseichter/Workdir"
license=('GPL-3.0-only')
options=('!debug')
depends=('python>=3.12' 'pyside6' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver//./-}.tar.gz")

# sha256sums is replaced by the CI workflow on each release.
sha256sums=('6b196445509f7bdf3400952148e362a4a7bc95f1db56f5d38bd0ed038ff22fc5')

build() {
    cd "Workdir-${pkgver//./-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Workdir-${pkgver//./-}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
