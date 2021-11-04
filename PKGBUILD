# Maintainer: calesanz <contrib at calesanz dot me>

_pkgname='python-sibc'
pkgname="${_pkgname}-git"
pkgver=1.0.1
pkgrel=2
pkgdesc='Supersingular Isogeny Based Cryptographic constructions'
arch=('any')
url='https://github.com/JJChiDguez/sibc'
license=('GPL3')
depends=('python'
        'python-click'
        'python-matplotlib'
        'python-networkx'
        'python-numpy'
        'python-progress'
        )
makedepends=('git' 'python-setuptools')
optdepends=()
provides=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
