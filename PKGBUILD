# Maintainer: dncrash <dncrash at gmail dot com>

pkgname="molecule"
pkgver=3.0a5
pkgrel=1
pkgdesc='aids in the development and testing of Ansible roles.'
url='https://github.com/ansible/molecule'
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools' 'python-cerberus' 'python-testinfra')
depends=('ansible'
         'ansible-lint'
         'python-cerberus'
         'python-click'
         'python-click-completion'
         'python-colorama'
         'python-cookiecutter'
         'flake8'
         'python-gilt'
         'python-jinja'
         'python-paramiko'
         'python-pathlib2'
         'python-pexpect'
         'python-pluggy'
         'python-pre-commmit'
         'python-pyaml'
         'python-sh'
         'python-six'
         'python-subprocess2'
         'python-tabulate'
         'python-testinfra'
         'python-tree-format-git'
         'yamllint')

checkdepends=('python' 'python-tox')
optdepends=('python-docker: docker driver'
            'python-boto: EC2 driver'
            'python-vagrant: vagrant driver'
            'python-shade: openstack driver')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ansible/molecule/archive/${pkgver}.tar.gz")
sha256sums=('a78050a00f51d806215e5cc5420dcb5c1403340fd25155b42f3b26d7cd10d97d')

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
