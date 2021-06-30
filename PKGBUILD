# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.9.8
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/tulir/mautrix-python"
depends=('python>=3.6')
makedepends=('python-setuptools')
license=('MPL')
arch=('any')
source=("https://github.com/tulir/mautrix-python/archive/v${pkgver/_rc/-rc}.tar.gz")
sha256sums=('69e9b0cc5cccc1fca758c548160dc1d5e4ca6bac7a5bf34d953947fecb43e0db')

prepare() {
    cd mautrix-python-${pkgver/_rc/-rc}
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

build() {
    cd mautrix-python-${pkgver/_rc/-rc}
    python setup.py build
}

package() {
    cd mautrix-python-${pkgver/_rc/-rc}
    python setup.py install --root="$pkgdir" --optimize=1 
}
