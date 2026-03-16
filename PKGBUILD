# Maintainer: Daniel Seichter <https://github.com/dseichter>
pkgname=workdir
# Version is derived from the git tag: v2026-03-10 → 2026.03.10
# Updated automatically by CI on each release tag.
pkgver=2026.03.10
pkgrel=1
pkgdesc="Work with multiple directories and run commands without navigating manually."
arch=('any')
url="https://github.com/dseichter/Workdir"
license=('GPL-3.0-only')
depends=('python>=3.12' 'python-pyside6' 'python-urllib3' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

# The source tarball is fetched from the GitHub release tag.
# pkgver uses dots (2026.03.10), the git tag uses dashes (v2026-03-10).
# The substitution ${pkgver//./-} converts dots back to dashes for the URL.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver//./-}.tar.gz")

# sha256sums is replaced by the CI workflow on each release.
sha256sums=('SKIP')

build() {
    cd "Workdir-${pkgver//./-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Workdir-${pkgver//./-}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
