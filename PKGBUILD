# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=gpt-engineer
pkgver=0.0.6
pkgrel=1
pkgdesc="Specify what you want it to build, the AI asks for clarification, and then builds it."
arch=('any')
url="https://github.com/AntonOsika/gpt-engineer"
license=('MIT')
depends=(python-openai python-termcolor python-typer)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41fd64897d23c39b5750f0317c7999d7f95f0184537e7bedc570f7fc49f897e8')


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$pkgname-$pkgver"
    pytest .
}
