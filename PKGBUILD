# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname='uoy-assessment-uploader'
_name='uoy-assessment-uploader'
pkgver='1.2.1'
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
sha256sums=('d15aeeca9d768f13d2f549c442ec0c7b457f5b3d6b7727f7b599bcb09fa3a156')

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
