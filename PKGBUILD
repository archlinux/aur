# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname='uoy-assessment-uploader'
_name='uoy-assessment-uploader'
pkgver='1.2.0'
pkgrel=1
pkgdesc='Tool for automating submitting assessments to the University of York Computer Science department.'
arch=('any')
url="https://github.com/joelsgp/uoy-assessment-uploader"
license=('GPL3')
depends=('python'
         'python-beautifulsoup4'
         'python-keyring'
         'python-requests')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools')
checkdepends=('python-pytest')
optdepends=()
provides=('python-uoy-assessment-uploader')
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('550d67219d4a6fbe33583905ad5e793fe745553b465422dc46a5d36216b41e60')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    pytest .
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
