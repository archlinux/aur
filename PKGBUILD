# Maintainer: David Runge <dave@sleepmap.de>
# Contributor:  Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

pkgbase=python-schedutils
pkgname=('python-schedutils' 'python2-schedutils')
pkgver=0.6
pkgrel=4
pkgdesc="Python interface for the Linux scheduler functions etc."
arch=('x86_64')
url="https://git.kernel.org/cgit/libs/python/python-schedutils/python-schedutils.git/"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://git.kernel.org/pub/scm/libs/python/${pkgbase}/${pkgbase}.git/snapshot/${pkgbase}-${pkgver}.tar.gz")
sha512sums=('e340cd60045f5f96ad722b1651ef5e26c3a99a4a986fbbcb0319e036a76a56c67b9b3792936da05776e43b4c92605f820f7fe6294b6197c00e5360c39767807b')


prepare() {
  cp -av "${pkgname[0]}-${pkgver}" "${pkgname[1]}-${pkgver}"
}

build() {
  cd "${pkgname[0]}-${pkgver}"
  python setup.py build
  cd ../"${pkgname[1]}-${pkgver}"
  python2 setup.py build
}

package_python-schedutils() {
  depends=('python')
  cd "${pkgname[0]}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
  install -t "${pkgdir}/usr/share/doc/${pkgname[0]}" -vDm644 {ChangeLog,README}
}

package_python2-schedutils() {
  depends=('python2')
  cd "${pkgname[1]}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
  install -t "${pkgdir}/usr/share/doc/${pkgname[1]}" -vDm644 {ChangeLog,README}
  mv -v "${pkgdir}/usr/bin/pchrt" "${pkgdir}/usr/bin/pchrt2"
  mv -v "${pkgdir}/usr/bin/ptaskset" "${pkgdir}/usr/bin/ptaskset2"
  mv -v "${pkgdir}/usr/share/man/man1/pchrt.1" \
    "${pkgdir}/usr/share/man/man1/pchrt2.1"
  mv -v "${pkgdir}/usr/share/man/man1/ptaskset.1" \
  "${pkgdir}/usr/share/man/man1/ptaskset2.1"
}
# vim:set ts=2 sw=2 et:

