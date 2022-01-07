# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.14.3
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/mautrix/python/"
depends=('python>=3.6')
makedepends=('python-setuptools')
license=('MPL')
arch=('any')
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"https://github.com/mautrix/python/archive/v${pkgver/_rc/-rc}.tar.gz")
sha256sums=('5630722d07db485066421a403abd8f08d29398530e3237b8bc8df64fd20fbee8')

prepare() {
    cd python-${pkgver/_rc/-rc}
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
    cd python-${pkgver/_rc/-rc}
    python setup.py build
}

package() {
    cd python-${pkgver/_rc/-rc}
    python setup.py install --root="$pkgdir" --optimize=1 
}
