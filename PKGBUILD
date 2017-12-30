# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>

_upstream_name=python-inet_diag
pkgname=python2-inet_diag
pkgver=0.2.1
pkgrel=1
pkgdesc="Python bindings for the inet_diag kernel interface"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/libs/python/python-inet_diag/python-inet_diag.git/"
license=('GPL')
depends=('python2')
source=("https://git.kernel.org/pub/scm/libs/python/${_upstream_name}/${_upstream_name}.git/snapshot/${_upstream_name}-${pkgver}.tar.gz")
sha512sums=('fe9c5a51d0b29abdb765990db37ab6f399aa5f46fa068655892181fea413d41a07486af7509540518a765d03fb4981a8a8784e5aa8b0367bb65bc36ef136be32')

prepare() {
  cd "${_upstream_name}-${pkgver}"
  sed -i '1s/python/python2/' psk.py
  sed -i '1s/python/python2/' pss.py
}

build() {
  cd "${_upstream_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_upstream_name}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
  install -Dm775 psk.py "${pkgdir}/usr/bin/psk"
  install -Dm775 pss.py "${pkgdir}/usr/bin/pss"
}
# vim:set ts=2 sw=2 et:
