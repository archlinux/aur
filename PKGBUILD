# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>

pkgname=python-zunclient
pkgver=4.6.0
_commit=e5864224476639ac2bc1fcf2e548b1bd0d10e07f
pkgrel=1
pkgdesc="Python bindings to the OpenStack Container API"
arch=('any')
url="https://docs.openstack.org/${pkgname}/latest/"
license=('Apache')
depends=('python-six' 'python-pbr' 'python-prettytable' 'python-openstackclient'
         'python-keystoneclient' 'python-keystoneauth1' 'python-osc-lib' 'python-oslo-i18n'
         'python-oslo-log' 'python-oslo-utils' 'python-websocket-client' 'python-docker'
         'python-yaml')
makedepends=('git')
checkdepends=('bandit' 'python-coverage' 'python-ddt' 'python-hacking' 'python-oslotest'
              'python-osprofiler' 'python-stestr' 'python-subunit' 'python-testresources'
              'python-testscenarios' 'python-testtools')
source=("git+https://opendev.org/openstack/${pkgname}.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgname}"
  stestr run
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
