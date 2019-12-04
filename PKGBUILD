# Maintainer: Denis Alevi <mail at denisalevi dot de>

pkgname=dpt-rp1-py-git
_name=${pkgname%-git}
pkgver=0.1.6r210.6faf448
pkgrel=1
pkgdesc='Python package to manage a Sony DPT-RP1'
url='https://github.com/janten/dpt-rp1-py'
arch=('any')
license=('MIT')
depends=('python-httpsig' 'python-requests' 'python-pbkdf2' 'python-urllib3' 'python-yaml' 'python-anytree' 'python-fusepy' 'python-zeroconf')
makedepends=('git' 'python-setuptools')
conflicts=('dpt-rp1-py')
provides=('dpt-rp1-py')
source=("git+https://github.com/janten/${_name}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  version=$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  # remove 'v' at start of tag, which is not part of the published package version
  echo ${vesion:1}
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=2 et:
