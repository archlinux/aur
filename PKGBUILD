# Maintainer: mdraw.gh at gmail dot com

pkgname=('python-httptools')
pkgver='0.0.9'
pkgrel=2
pkgdesc='Fast HTTP parser'
arch=('i686' 'x86_64')
url='https://github.com/MagicStack/httptools'
license=('MIT')
makedepends=('python-setuptools' 'cython' 'http-parser')
source=("https://github.com/MagicStack/httptools/archive/v${pkgver}.tar.gz"
        '0001-setup.py-Use-Cython-directly.patch'
        '0002-use-system-http_parser.patch')
sha256sums=('ce82e03f2d705b1efc03bed5773436f2466de755d2faaf08e902a0f025700053'
            'f32dd7a31a858ec52c4ed7559a7dc358fb03702160bf388c7dbd4ad5802524d4'
            '42e9d6041eb5c5fece89596e9ca2b5dc718aceda5892eb3144d0bd849633b10a')

prepare() {
    cd "${srcdir}/httptools-${pkgver}"
    patch -p1 -i "${srcdir}/0001-setup.py-Use-Cython-directly.patch"
    patch -p1 -i "${srcdir}/0002-use-system-http_parser.patch"
}

package_python-httptools() {
    depends=('python' 'http-parser')
    cd "${srcdir}/httptools-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
