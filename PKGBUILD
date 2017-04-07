# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-shade' 'python2-shade')
pkgver='1.19.0'
pkgrel='1'
pkgdesc='Simple client library for interacting with OpenStack clouds'
arch=('any')
url='http://docs.openstack.org/infra/shade'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack-infra/shade#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cp -a shade{,-py2}
}

build() {
  cd "$srcdir"/shade
  python setup.py build

  cd "$srcdir"/shade-py2
  python2 setup.py build
}

package_python-shade(){
  depends=('python-dogpile.cache' 'python-magnumclient' 'python-heatclient'
           'python-swiftclient' 'python-ironicclient' 'python-troveclient'
           'python-neutronclient' 'python-cinderclient' 'python-glanceclient'
           'python-keystoneclient' 'python-novaclient' 'python-netifaces'
           'python-keystoneauth1' 'python-six' 'python-requestsexceptions'
           'python-os-client-config' 'python-jsonpatch' 'python-jmespath'
           'python-decorator' 'python-munch' 'python-pbr')
  cd "${srcdir}/shade"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-shade() {
  depends=('python-dogpile.cache' 'python-magnumclient' 'python-heatclient'
           'python-swiftclient' 'python-ironicclient' 'python-troveclient'
           'python-neutronclient' 'python-cinderclient' 'python-glanceclient'
           'python-keystoneclient' 'python-novaclient' 'python-netifaces'
           'python-keystoneauth1' 'python-six' 'python-requestsexceptions'
           'python-os-client-config' 'python2-ipaddress' 'python-jsonpatch'
           'python-jmespath' 'python-decorator' 'python-munch' 'python-pbr')
  cd "${srcdir}/shade-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/shade-inventory{,2}
}

# vim:set ts=2 sw=2 et:
