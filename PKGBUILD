# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-aim'
pkgname=('python-aim')
_module='aim'
pkgver='3.16.0'
pkgrel=1
pkgdesc="A super-easy way to record, search and compare AI experiments."
url="https://github.com/aimhubio/aim"
depends=(
  'python'
  "python-aim-ui=$pkgver"
  'python-aimrecords=0.0.7'
  'python-aimrocks=0.3.1'
  'python-cachetools'
  'python-click'
  'python-cryptography'
  'python-filelock'
  'python-numpy'
  'python-psutil'
  'python-py3nvml'
  'python-restrictedpython'
  'python-tqdm'
  'python-aiofiles'
  'python-alembic'
  'python-fastapi'
  'python-jinja'
  'python-pytz'
  'python-sqlalchemy'
  'uvicorn'
  'python-pillow'
  'python-protobuf'
  'python-packaging'
  'python-dateutil'
  'python-requests'
  'python-segment-analytics-python'
)
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5e05c9d0ad0aaf8c4859bc717f6b51b13f563efd587d6135e93341d6a0aa9d52')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    sed -i 's:show_all_warnings=True::g' setup.py
}

build() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
