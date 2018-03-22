# Maintainer: Morten Linderud <morten@linderud.pw>  
pkgname="molecule"
pkgver=2.11
pkgrel=1
pkgdesc='aids in the development and testing of Ansible roles.'
url='https://github.com/metacloud/molecule'
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('ansible-lint' 'python-ansible' 'python-colorama' 'flake8'
         'python-jinja' 'python-marshmallow' 'python-gilt' 'python'
         'python-tabulate' 'python-pbr' 'python-pexpect' 'python-cookiecutter'
         'python-yaml' 'python-sh' 'python-click' 'python-click-completion'
         'python-tree-format-git' 'yamllint' 'python-anyconfig')
checkdepends=('python' 'python-tox')
optdepends=('python-docker: docker driver'
            'python-boto: EC2 driver'
            'python-vagrant: vagrant driver'
            'python-shade: openstack driver')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metacloud/molecule/archive/${pkgver}.tar.gz")
sha256sums=('3690abe30d280799018d70f94a7c9a063bd409dec2d7d5324e0962d7329ed0dc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PBR_VERSION="${pkgver}"
  python setup.py build
}

check(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  tox -e py3
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PBR_VERSION="${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
