# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=gpt-engineer
pkgver=0.0.7
pkgrel=1
pkgdesc="Specify what you want it to build, the AI asks for clarification, and then builds it."
arch=('any')
url="https://github.com/AntonOsika/gpt-engineer"
license=('MIT')
depends=(python-openai python-termcolor python-typer)
makedepends=(python-build python-installer python-wheel)
#checkdepends=(python-pytest)
install=gpt-engineer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('237977ed3b9e5dff8f457e68e7df08ef342a527e86790342ded16db75deea866')


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# Disabled due to rudder-sdk-python dependency
# https://github.com/AntonOsika/gpt-engineer/commit/f159dc45f2dccfa7c1f5b4d8290e168d48175104
#check() {
#    cd "$pkgname-$pkgver"
#    pytest .
#}
