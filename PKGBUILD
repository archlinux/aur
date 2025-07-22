# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-trackio
_pkgname=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc='A lightweight, local-first, and free experiment tracking library'
arch=('any')
url='https://github.com/gradio-app/trackio'
license=('MIT')
groups=('huggingface')
depends=('python-pandas' 'python-huggingface-hub' 'python-gradio')
makedepends=('python-installer' 'unzip')
optdepends=()
_wheel="${_pkgname-}-${pkgver}-py3-none-any.whl"
source=("${_wheel}::https://files.pythonhosted.org/packages/84/1f/e05cf89b42f069cf5682900968b1d632cc32c65220a1ca7a04545906d884/trackio-0.1.0-py3-none-any.whl")
noextract=("${_wheel}")
sha256sums=('db46c9d88e3ba552e1c38996e2dfe21c157c9929bb71658d98ad49e2858819c8')

prepare() {
    mkdir -p "${_pkgname}-${pkgver}"
    cd "${_pkgname}-${pkgver}"
    unzip -jo "../${_wheel}" trackio-0.1.0.dist-info/licenses/LICENSE
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir "../${_wheel}"
}
