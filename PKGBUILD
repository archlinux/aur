# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-segment-analytics'
pkgname=('python-segment-analytics')
_module='segment-analytics-python'
pkgver='2.2.2'
pkgrel=1
pkgdesc="The hassle-free way to integrate analytics into any python application."
url="https://github.com/segmentio/analytics-python"
depends=(
  'python'
  "python-backoff"
  "python-dateutil"
  "python-monotonic"
  "python-requests"
)
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pylint' 'flake8')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('10ef6ee42b9e504b9db76b44c893e6a44c3ebc51cd01f475ac76f0e80a8fff09')

build() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}" || exit 1
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  make test
}
