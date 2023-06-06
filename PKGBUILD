# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname='uoy-assessment-uploader'
_name='uoy_assessment_uploader'
pkgver='0.6.0'
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
             'python-flit-core')
checkdepends=('python-pytest')
optdepends=()
provides=('python-uoy-assessment-uploader')
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b5ca15f087b6c5f88568b2ff515e7fbf76779a1e48d3b5823c7aab4ae81c2f28')

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
