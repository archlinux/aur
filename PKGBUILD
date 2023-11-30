# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>


_name=pytango
pkgname=python-${_name}
pkgver=9.5.0
_tag=v${pkgver}
pkgrel=1
pkgdesc="A python binding for the Tango control system"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://pytango.readthedocs.io/en/stable/'
license=('LGPL3')
groups=('tango-controls')
depends=('tango-cpp>=9.4.0' 'boost' 'python-numpy' 'python-six'
	 'python-gevent' 'python-pytest' 'python-psutil')
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme python-numpy python-scikit-build-core)

source=("${_name}-${_tag}.tar.gz::https://gitlab.com/tango-controls/${_name}/-/archive/v${pkgver}/${_name}-${_tag}.tar.gz" pyproject.patch)
sha256sums=(
            '07e0ddc0530a0cd78124787107f69474b28bd88ff5077e609c05959b7354f3b0'
            '0d878261df397ae698759a06d9494c06f94ee48cbe799282f6721013d2c78e7f'
)

prepare() {
  cd "${_name}-${_tag}"
  patch -N -p1 --input="${srcdir}/pyproject.patch"
}

build() {
  cd "${_name}-${_tag}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${_tag}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
