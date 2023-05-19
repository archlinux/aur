# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=confluence-publisher
pkgname=${_pkgname}-git
pkgver=v1.2.1.24.gebca4c2
pkgrel=2
pkgdesc='Tool for publishing Sphinx generated documents to Confluence'
url="https://github.com/Arello-Mobile/${_pkgname}"
arch=('any')
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python-yaml' 'python-requests')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/-/./g'
}

check() {
  cd "${srcdir}/${_pkgname}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
