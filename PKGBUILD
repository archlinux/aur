# $Id$
# Maintainer: Roberto Valentini <valantin89 [at] gmail [dot] com>

pkgbase=python-neutronclient
pkgname=(python-neutornclient python2-neutronclient)
pkgver=6.6.0
pkgrel=1
pkgdesc="CLI and Client Library for OpenStack Networking"
arch=('any')
url="http://docs.openstack.org/developer/python-neutronclient"
license=('Apache')
makedepends=('python-pbr>=2.0.0'
             'python2-pbr>=2.0.0'
             'python-cliff>=2.8.0'
             'python2-cliff>=2.8.0'
             'python-debtcollector>=1.2.0'
             'python2-debtcollector>=1.2.0'
             'python-iso8601>=0.1.11'
             'python2-iso8601>=0.1.11'
             'python-netaddr>=0.7.18'
             'python2-netaddr>=0.7.18'
             'python-osc-lib>=1.8.0'
             'python2-osc-lib>=1.8.0'
             'python-oslo-i18n>=3.15.3'
             'python2-oslo-i18n>=3.15.3'
             'python-oslo-serialization>=2.18.0'
             'python2-oslo-serialization>=2.18.0'
             'python-oslo-utils>=3.33.0'
             'python2-oslo-utils>=3.33.0'
             'python-os-client-config>=1.28.0'
             'python2-os-client-config>=1.28.0'
             'python-keystoneauth1>=3.3.0'
             'python2-keystoneauth1>=3.3.0'
             'python-keystoneclient>=3.8.0'
             'python2-keystoneclient>=3.8.0'
             'python-requests>=2.14.2'
             'python2-requests>=2.14.2'
             'python-simplejson>=3.5.1'
             'python2-simplejson>=3.5.1')
#checkdepends=('python-oslotest' 'python2-oslotest' 'python-requests-mock' 'python2-requests-mock')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/openstack/python-neutronclient/archive/$pkgver.tar.gz")
sha512sums=('9e5a9d45444bfa37852d338262db45e0b158dda4d69af171c0aa542c6ffe2ce0fcea8a791352be9a1c9d52d172f964637a68f43f4909cfdc012872ec16baf697')

prepare() {
  cp -a python-neutronclient-$pkgver{,-py2}

  export PBR_VERSION=$pkgver
}

build() {
  cd "$srcdir"/python-neutronclient-$pkgver
  python setup.py build

  cd "$srcdir"/python-neutronclient-$pkgver-py2
  python2 setup.py build
}

#check() {
#  cd "$srcdir"/python-neutronclient-$pkgver
#  python setup.py testr
#
#  cd "$srcdir"/python-neutronclient-$pkgver-py2
#  PYTHON=python2 python2 setup.py testr
#}

package_python-neutornclient() {
  depends=('python-pbr' 'python-cliff' 'python-debtcollector' 'python-iso8601'
           'python-netaddr' 'python-osc-lib' 'python-oslo-i18n'
           'python-oslo-serialization' 'python-oslo-utils' 'python-os-client-config'
           'python-keystoneauth1' 'python-keystoneclient' 'python-requests'
           'python-simplejson')

  cd "$srcdir"/python-neutronclient-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-neutronclient() {
  depends=('python2-pbr' 'python2-cliff' 'python2-debtcollector' 'python2-iso8601'
           'python2-netaddr' 'python2-osc-lib' 'python2-oslo-i18n'
           'python2-oslo-serialization' 'python2-oslo-utils'
           'python2-os-client-config' 'python2-keystoneauth1' 'python2-keystoneclient'
           'python2-requests' 'python2-simplejson')

  cd "$srcdir"/python-neutronclient-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/neutron{,2}
}

# vim:set ts=2 sw=2 et:
