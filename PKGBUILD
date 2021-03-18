# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sander Boom <sanderboom@gmail.com>

_pkgname=ansible-lint
pkgname=ansible-lint-git
pkgver=r1348.4d1a572
pkgrel=1
pkgdesc="Checks playbooks for practices and behaviour that could potentially be improved."
arch=('any')
url="https://github.com/ansible/ansible-lint"
license=('MIT')
depends=('python' 'python-ruamel-yaml' 'python-pyaml' 'python-rich' 'python-packaging'
          'python-wcmatch' 'python-enrich')
makedepends=('git' 'python-setuptools' 'python-setuptools_scm' 'python-toml')
checkdepends=('python-pytest')
optdepends=('yamllint: check for yaml syntax mistakes' 'ansible: check playbooks')
provides=('ansible-lint')
conflicts=('ansible-lint')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
