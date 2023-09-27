# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=python-timew-report
_name=${pkgname#python-}
pkgver=1.4.0
pkgrel=2
pkgdesc="An interface for Timewarrior report data"
arch=('any')
license=('MIT')
url="https://github.com/lauft/timew-report"
depends=('python' 'python-dateutil' 'python-deprecation')
source=(
        "$_name-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz"
    )
sha256sums=('db12d01c0a9edc88d8ee76bb20fb15deda0a71d10c6cca69fc7eb4f5d41b4cd9')
makedepends=(python-build python-installer python-wheel)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
