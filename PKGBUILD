# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=awx-git
pkgver=r14744.1.0.0_294_g0da416b1413b
pkgrel=1
pkgdesc="AWX provides a web-based user interface, REST API, and task engine built on top of Ansible."
arch=('any')
url="https://github.com/ansible/awx"
license=('Apache-2.0')
depends=('python2' 'gettext')
options=(!emptydirs)
source=("git+https://github.com/ansible/awx.git")

pkgver() {
  cd awx
  echo "r$(git rev-list --count HEAD).$(git describe --always | sed 's/-/_/g')"
}

build() {
  cd "${srcdir}/awx"
  python2 setup.py build
}

package() {
  cd "${srcdir}/awx"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP')
