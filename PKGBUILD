# Maintainer: mdraw.gh at gmail dot com

# If anyone knows how to make the http-parser submodule work
# without this ugly hack in package(), please tell me!

pkgname=('python-httptools')
pkgver='0.0.9'
pkgrel=1
pkgdesc='Fast HTTP parser'
arch=('any')
url='https://github.com/MagicStack/httptools'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/MagicStack/httptools/archive/v${pkgver}.tar.gz")
md5sums=('7f5c62a9d7fed2cb31887d6068006d83')

package_python-httptools() {
    cd "${srcdir}/httptools-${pkgver}"

    # Git submodule workaround
    pushd vendor
    rm -rf http-parser
    git clone https://github.com/nodejs/http-parser.git
    pushd http-parser
    git checkout '9b0d5b3' # re-check this hash when updating
    popd
    popd

    cython httptools/parser/parser.pyx
    python setup.py install --root="${pkgdir}" --optimize=1
}
