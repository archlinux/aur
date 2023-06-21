# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=gpt-engineer
pkgver=0.0.3
pkgrel=1
pkgdesc="Specify what you want it to build, the AI asks for clarification, and then builds it."
arch=('any')
url="https://github.com/AntonOsika/gpt-engineer"
license=('MIT')
depends=(python-openai python-termcolor python-typer)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('67e26dcc41af0a6abce8d9fe8d9d812b2d6ed0eb955740abe50d7ff685ae2186')


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
