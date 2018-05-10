# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=python-validate_email-git
_distname=validate_email
pkgver=r39.eaf2668
pkgrel=1
pkgdesc="Python library that checks if an email is valid, properly formatted and really exists"
arch=('any')
license=('LGPL')
url="https://github.com/syrusakbary/validate_email"
makedepends=('python-setuptools')
source=("git+https://github.com/syrusakbary/validate_email.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_distname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${_distname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_distname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

