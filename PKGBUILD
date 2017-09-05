# Maintainer: Morten Linderud <morten@linderud.pw>  
pkgname="molecule"
pkgver=2.0.4
pkgrel=1
_commit=303337927095ab09957fca03ad145f176d0acb0c
pkgdesc='aids in the development and testing of Ansible roles.'
url='https://github.com/metacloud/molecule/tree/2.0.0.rc12'
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('ansible-lint' 'python-ansible' 'python-colorama' 'flake8'
         'python-jinja' 'python-marshmallow' 'python-gilt' 'python'
         'python-tabulate' 'python-pbr' 'python-pexpect' 'python-cookiecutter'
         'python-yaml' 'python-sh' 'python-click' 'python-click-completion'
         'python-tree-format-git' 'yamllint' 'python-anyconfig')
optdepends=('python-docker: docker driver'
            'python-boto: EC2 driver'
            'python-vagrant: vagrant driver'
            'python-shade: openstack driver')
source=("${pkgname}-${pkgver}::git://github.com/metacloud/molecule.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PBR_VERSION="${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PBR_VERSION="${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
