# Maintainer: Daniel Seichter <https://github.com/dseichter>
pkgname=workdir
pkgver=2026.03.16.beta13
pkgrel=1
pkgdesc="Work with multiple directories and run commands without navigating manually."
arch=('any')
url="https://github.com/dseichter/Workdir"
license=('GPL-3.0-only')
options=('!debug')
depends=('python>=3.12' 'pyside6' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver//./-}.tar.gz")
sha256sums=('0bd46226d528443009db51f414122a345103e1ddc8c73a6271214d1ea6fc53b3')

build() {
    cd "Workdir-${pkgver//./-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Workdir-${pkgver//./-}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "data/io.github.dseichter.workdir.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.dseichter.workdir.png"
}
