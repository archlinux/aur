# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=gpt-engineer
pkgver=0.2.8
pkgrel=2
pkgdesc="Specify what you want it to build, the AI asks for clarification, and then builds it."
arch=('any')
url="https://pypi.org/project/gpt-engineer/"
license=('MIT')
depends=('python>=3.10' python-openai python-termcolor python-typer
        python-langchain python-backoff python-tiktoken python-dotenv
        python-dataclasses-json python-langchain-community python-tabulate
        python-toml)
makedepends=(python-build python-installer python-wheel python-poetry-core)
#checkdepends=(python-pytest python-protonvpn-nm-lib)
install=gpt-engineer.install
source=("https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname/-/_}-${pkgver}.tar.gz")
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('58d1aeff941be5620a1c17b3df80454771bcff81e780912892973d18175c6e91')


build() {
    cd "${pkgname/-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname/-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Disabled due to rudder-sdk-python dependency
# https://github.com/AntonOsika/gpt-engineer/commit/f159dc45f2dccfa7c1f5b4d8290e168d48175104
#check() {
#    cd "${pkgname}-${pkgver}"
#    pytest .
#}
