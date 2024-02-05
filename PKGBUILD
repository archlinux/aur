# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=gpt-engineer
pkgver=0.2.6
pkgrel=1
pkgdesc="Specify what you want it to build, the AI asks for clarification, and then builds it."
arch=('any')
url="https://github.com/AntonOsika/gpt-engineer"
license=('MIT')
depends=(python python-openai python-termcolor python-typer python-langchain
        python-backoff python-tiktoken python-dotenv python-dataclasses-json
        python-langchain-community)
makedepends=(python-build python-installer python-wheel)
#checkdepends=(python-pytest python-protonvpn-nm-lib)
install=gpt-engineer.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-python3.8-11-compatible.tar.gz")
sha256sums=('9d1afc264387976cae65aa5b55936eaeb336db8938d7c3248cdf591cf1bb9986')


build() {
    cd "$pkgname-$pkgver-python3.8-11-compatible"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver-python3.8-11-compatible"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Disabled due to rudder-sdk-python dependency
# https://github.com/AntonOsika/gpt-engineer/commit/f159dc45f2dccfa7c1f5b4d8290e168d48175104
#check() {
#    cd "$pkgname-$pkgver"
#    pytest .
#}
