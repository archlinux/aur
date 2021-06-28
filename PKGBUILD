# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='nextinspace'
pkgname="${_pkgname}-git"
pkgver=2.0.3.r0.g846056c
pkgrel=1
pkgdesc='Print upcoming space-related events to your terminal'
arch=('any')
url='https://github.com/not-stirred/nextinspace'
_url_pypi='https://pypi.org/project/nextinspace'
license=('GPL3')
depends=('python-colorama>=0.4.3' 'python-requests>=2.24' 'python-tzlocal')
makedepends=('git' 'python-setuptools' 'python-dephell')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
