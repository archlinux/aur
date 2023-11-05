# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranopkgcheck
pkgver=0.3.0
pkgrel=6
pkgdesc='Murano package validator tool'
arch=('any')
url='https://docs.openstack.org/murano-pkg-check/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-yaql' 'python-six'
         'python-stevedore' 'python-semantic-version' 'python-oslo-i18n')
checkdepends=('python-subunit' 'python-oslotest' 'python-oslotest'
              'python-testrepository' 'python-testscenarios' 'python-testtools'
              'python-stestr' 'python-mock')
source=("https://opendev.org/openstack/murano-pkg-check/archive/$pkgver.tar.gz")
sha512sums=('efc83424137deb304559ef884eb6ab686369cd25718ae64c2eeb52d3d9f666ca8dee62414eea993120376fb49b4d348f14dc9c26c05353288a2330b592595710')

export PBR_VERSION=$pkgver

build() {
  cd murano-pkg-check
  python setup.py build
}

check() {
  cd murano-pkg-check
  #stestr run
  sed -i 's/cases.extend(list(yaml.load_all(f)))/cases.extend(list(yaml.load_all(f, yaml.SafeLoader)))/g' muranopkgcheck/tests/functional/test_cases.py
  python setup.py test
}

package() {
  cd murano-pkg-check
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
