# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=python-mautrix
pkgver=0.5.3
pkgrel=1
pkgdesc="A Python 3 asyncio Matrix framework."
url="https://github.com/tulir/mautrix-python"
depends=('python')
makedepends=('python3' 'python-setuptools')
license=('')
arch=('any')
source=("https://github.com/tulir/mautrix-python/archive/v${pkgver/_rc/rc}.tar.gz")
sha256sums=('b3edfb6411d912205fc76ab61525d93b3c602fd878e58e4f870374333eb7a57c')

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
