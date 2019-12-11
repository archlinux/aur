# Maintainer: dncrash <dncrash at gmail dot com>

pkgname="molecule"
pkgver=3.0a4
pkgrel=1
pkgdesc='aids in the development and testing of Ansible roles.'
url='https://github.com/metacloud/molecule'
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools' 'python-cerberus' 'python-testinfra')
depends=('ansible-lint'
         'python-anyconfig'
         'python-cerberus'
         'python-click'
         'python-click-completion'
         'python-colorama'
         'python-cookiecutter'
         'flake8'
         'python-gilt'
         'python-jinja'
         'python-pbr'
         'python-pexpect'
         'python-psutil'
         'python-pyaml'
         'python-sh'
         'python-six'
         'python-tabulate'
         'python-testinfra'
         'python-tree-format-git'
         'yamllint'
         'python-shellingham')

checkdepends=('python' 'python-tox')
optdepends=('python-docker: docker driver'
            'python-boto: EC2 driver'
            'python-vagrant: vagrant driver'
            'python-shade: openstack driver')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metacloud/molecule/archive/${pkgver}.tar.gz")
sha256sums=('7b81fcb7816639426c619d10b2a768913f7d5152340df7fb2277ef84482551e6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PBR_VERSION="${pkgver}"
  python setup.py build
}

check() {
  # cd "${srcdir}/${pkgname}-${pkgver}"
  # tox -e py3
  true
  # requires tox-tags which isn't in the official packages or in AUR
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PBR_VERSION="${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -R molecule/cookiecutter "${pkgdir}/usr/lib/python3.8/site-packages/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
