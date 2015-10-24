# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=python2-pyliblo
pkgver=0.10.0
pkgrel=1
pkgdesc='Python wrapper for the liblo OSC library'
arch=('i686' 'x86_64')
url='http://das.nasophon.de/pyliblo/'
license=('GPL')
depends=('python2' 'liblo>=0.27')
makedepends=('cython2')
source=("http://das.nasophon.de/download/pyliblo-${pkgver}.tar.gz")
sha512sums=('d2a3d47f6c52d310104256d33fbd5d652ae6bc8cde32c2d3b2f3f407b8a4aba99028e57cd466804d266f63468a6c792760f28a43dbabcfa3330e0a852ee4d4e3')

build() {
  cd "${srcdir}/pyliblo-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pyliblo-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}/"
  # Prevent conflicts with Python 3 version of package
  mv "${pkgdir}/usr/bin/dump_osc" "${pkgdir}/usr/bin/dump_osc2"
  mv "${pkgdir}/usr/bin/send_osc" "${pkgdir}/usr/bin/send_osc2"
  rm -rf "${pkgdir}/usr/share/"
}
