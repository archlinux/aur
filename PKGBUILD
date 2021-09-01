# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
_name='datasets'
pkgname="python-${_name}"
pkgver=1.11.0
pkgrel=1
pkgdesc="Library providing one-line dataloaders for many public datasets and efficient data pre-processing"
arch=('i686' 'x86_64')
url="https://github.com/huggingface/${_name}"
license=('Apache')
depends=('python-pyarrow' 'python-dill' 'python-pandas' 'python-xxhash' 'python-multiprocess' 'python-aiohttp' 'python-huggingface-hub')
makedepends=('python-setuptools')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e605b04f6793864e9fd691722a4bace5b6350861dc0d6839b3d28f18e495a918')

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
}
