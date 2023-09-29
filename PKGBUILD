# Maintainer: Anakojm <https://anakojm.net/a-propos/#contact>

pkgname='python-hwrt'
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="HandWriting Recognition Toolkit, draw and get the LaTeX command"
arch=('any')
url="https://pypi.org/project/$_name/"
license=('MIT')
depends=('python>=3.6.0' 'python-numpy' 'python-scipy' 'python-pymysql' 'python-pillow' 'python-natsort' 'python-matplotlib' 'python-yaml' 'python-flask' 'python-click' 'python-setuptools' 'python-jinja' 'python-bootstrap-flask' 'python-nntoolkit' 'python-h5py' 'python-keras')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('38d425cc7524794c61f6e4444e14300db28c4e989f2851b2708cd57a50c0902e')

build(){
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$_name-$pkgver"

    _pythonversion="$(python --version | awk '{print $2}' | awk -F. '{print $1"."$2}')"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -Rfv "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/tests"
}
