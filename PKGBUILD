# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
_name='datasets'
pkgname="python-${_name}"
pkgver=1.17.0
pkgrel=1
pkgdesc="Library providing one-line dataloaders for many public datasets and efficient data pre-processing"
arch=('i686' 'x86_64')
url="https://github.com/huggingface/${_name}"
license=('Apache')
depends=('python-pyarrow' 'python-dill' 'python-pandas' 'python-xxhash' 'python-multiprocess' 'python-aiohttp' 'python-huggingface-hub' 'python-fsspec')
makedepends=('python-setuptools')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0d8c98c9a91c164e6e550d1262d317cc240f4c748b026b32cfc8d777d2ac0ab7')

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
}
