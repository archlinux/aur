# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.5.4
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/tulir/mautrix-python"
depends=('python')
makedepends=('python3' 'python-setuptools')
license=('')
arch=('any')
source=("https://github.com/tulir/mautrix-python/archive/v${pkgver/_rc/rc}.tar.gz")
sha256sums=('eb9992884eb9518ed56b1bef763f6448aba59cd72f7fcbd8d5fb8d5cbc637fa1')

prepare() {
    cd $srcdir/mautrix-python-${pkgver/_rc/rc}
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
    cd mautrix-python-${pkgver/_rc/rc}
    python setup.py build
}

package() {
    cd mautrix-python-${pkgver/_rc/rc}
    python setup.py install --root="$pkgdir" --optimize=1 
}
