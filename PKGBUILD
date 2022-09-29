# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Ernesto Castellotti <erny.castell@gmail.com>

# shellcheck disable=SC2034
_pkg="blivet"
_pkgname="python-${_pkg}"
pkgname="${_pkgname}-git"
pkgver=blivet+2.0.2+1+r1649+gbadffc78
pkgrel=1
pkgdesc='a python module for management of a system storage configuration - python 3.x pkg'
arch=('x86_64' 'i686' 'pentium4')
depends=('multipath-tools' 'mpathconf' 'mdadm' 'libblockdev' 'libselinux'
         'python-six' 'python-pyudev' 'hawkey' 'python-pyparted' 'python-pykickstart')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('LGPL2.1')
url='http://fedoraproject.org/wiki/Blivet'
source=("git+https://github.com/storaged-project/${_pkg}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkg}" || exit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

# shellcheck disable=SC2154
package() {
	cd "${srcdir}/${_pkg}" || exit
	python setup.py install --root="${pkgdir}/" --optimize=1
}
