# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

_upstream_name=python-linux-procfs
pkgname=python2-linux-procfs
pkgver=0.5.1
pkgrel=1
pkgdesc="Linux /proc abstraction classes for python"
arch=('any')
url="https://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git/"
license=('GPL')
depends=('python2')
source=("https://git.kernel.org/pub/scm/libs/python/${_upstream_name}/${_upstream_name}.git/snapshot/${_upstream_name}-${pkgver}.tar.gz")
sha512sums=('eb57fbc17e918cea1234323bf48ea228df00dafb5344dad94cf88c63116058c75c4e8113e203d10eb5005592aad5d55abfc9587d43e18b4ff5ac100833ad3cee')

prepare() {
  cd "${_upstream_name}-${pkgver}"
  # fixing shebang of scripts
  sed -i '1s/python/python2/' procfs/*.py
}

build() {
  cd "${_upstream_name}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${_upstream_name}-${pkgver}"
  python2 setup.py test
}

package() {
  cd "${_upstream_name}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
