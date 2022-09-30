# Maintainer: George Angelopoulos <george@usermod.net>

pkgname=hotsos-git
pkgver=1
pkgrel=1
pkgdesc='Software analysis toolkit'
arch=('any')
url='https://github.com/canonical/hotsos'
license=('Apache')
depends=('python-click'
         'python-progress'
         'python-simplejson'
         'python-cryptography'
         'python-pyaml')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/canonical/hotsos")
md5sums=('SKIP')

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/etc/hotsos/defs"
  cp -r defs/* "${pkgdir}/etc/hotsos/defs"
}
# vim:set ts=2 sw=2 et:
