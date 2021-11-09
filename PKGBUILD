# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit-git
_gitpkgname=pip-audit
pkgver=r61.844c85f
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/trailofbits/pip-audit'
license=('Apache')
depends=('python-pip-api' 'python-packaging' 'python-dataclasses' 'python-progress' 'python-resolvelib' 'python-html5lib' 'python-cachecontrol' 'python-lockfile')
makedepends=('git' 'python-setuptools')
conflicts=('python-pip-audit')
options=('!strip')
source=("${_gitpkgname}::git+https://github.com/trailofbits/pip-audit.git")
sha512sums=('SKIP')

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitpkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitpkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
