pkgname=python2-temper
pkgver=1.5.1
pkgrel=1
pkgdesc="This is a rewrite of a userspace USB driver for TEMPer devices presenting a USB ID like this: 0c45:7401 Microdia"
arch=('any')
license=('unknown')
url='https://github.com/padelt/temper-python'
makedepends=('python-distribute')
install=${pkgname}.install
source=("https://github.com/padelt/temper-python/archive/v${pkgver}.tar.gz")
sha256sums=('9edd0fa91975d83edffbcc0211843815bd07305adddad21669de0467a9d487b0')
depends=('python2' 'python2-pyusb-git' 'python2-setuptools' 'python2-snmp-passpersist')
provides=("${pkgname}")

prepare() {
  cd "${srcdir}/temper-python-${pkgver}"
  sed -i 's/python/python2/g' "${srcdir}/temper-python-${pkgver}/etc/munin-temperature"
}
package() {
  cd "${srcdir}/temper-python-${pkgver}"
  python2 setup.py install --root "${pkgdir}"
  mkdir -p "${pkgdir}/etc/udev/rules.d" "${pkgdir}/usr/lib/munin/plugins"
  install -Dm644 "${srcdir}/temper-python-${pkgver}/etc/99-tempsensor.rules" "${pkgdir}/etc/udev/rules.d/"
  install -Dm755 "${srcdir}/temper-python-${pkgver}/etc/munin-temperature" "${pkgdir}/usr/lib/munin/plugins/temper"
}
