# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-pyuavcan-0-1
pkgver=0.1.32
pkgrel=1
pkgdesc='Python implementation of the UAVCAN protocol stack.'
arch=('x86_64')
url='https://pyuavcan.readthedocs.io'
license=('MIT')
depends=('python' 'python-pydsdl' 'python-numpy' 'python-nunavut')
optdepends=('python-can' 'python-pyserial' 'python-ruamel-yaml'
            'python-requests' 'python-simplejson')
makedepends=('python' 'python-setuptools')
provides=('python-pyuavcan=0.1')
conflicts=('python-pyuavcan')
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/pyuavcan/archive/1.0.0.dev32.tar.gz"
        "dsdl_files::https://github.com/UAVCAN/public_regulated_data_types/archive/103745afb42f15f83d49fc23530f7fe2c11358b8.tar.gz")
sha256sums=('ccfe3c60fd82d8758b5125a584525b34933437cc4014ee687e07e81a67bb0f8f'
            '4305e8686ff87351eb716263a9ef62f6870448ab15d31ee578b9cba5bd517c8c')

_pkgname=pyuavcan
_pkgver=1.0.0.dev32

prepare() {
    cd "$srcdir"
    mv -n public_regulated_data_types-103745afb42f15f83d49fc23530f7fe2c11358b8/* \
          "${_pkgname}-${_pkgver}/uavcan/dsdl_files"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
