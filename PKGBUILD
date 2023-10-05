# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname='uoy-assessment-uploader'
_name='uoy_assessment_uploader'
pkgver='1.0.0'
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
sha256sums=('ed0dd086e667bec7ea68f97d8400416bcf4a6bd87731e31c4158bdce992cc2df')

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
