# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.8.5
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/tulir/mautrix-python"
depends=('python>=3.6')
makedepends=('python-setuptools')
license=('MPL')
arch=('any')
source=("https://github.com/tulir/mautrix-python/archive/v${pkgver/_rc/-rc}.tar.gz")
sha256sums=('b9ab9d4e60e60369040a8d3ba68509a1f4bcdba306d8caf43e6ec36520bcf220')

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
