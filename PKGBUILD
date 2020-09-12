# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=python-pynrfjprog-git
_pkgname=${pkgname%-git}
_gitname=${_pkgname/python-}
pkgver=r29.aed16b9
pkgrel=1
pkgdesc="Python wrapper around the nrfjprog dynamic link library (DLL)"
arch=('any')
url="https://github.com/NordicSemiconductor/pynrfjprog"
license=('custom')
depends=('python-future')
makedepends=('python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/NordicSemiconductor/pynrfjprog"
        "fixed-LICENSE-name.patch")
sha256sums=('SKIP'
            '8312eb036c27ab467f25f367a0ca82e71eafc5ee184d1716578c9a6e1e17a6c8')

pkgver() {
  cd ${_gitname}

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_gitname}

  patch --forward --strip=1 --input="${srcdir}/fixed-LICENSE-name.patch"
}

build() {
  cd ${_gitname}

  python setup.py build
}

package() {
  cd $_gitname

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: set sw=2 ts=2 et:
