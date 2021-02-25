# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=standard-test-roles
pkgver=4.10
pkgrel=1
pkgdesc='Standard Test Interface Ansible roles'
arch=('any')
url='https://fedoraproject.org/wiki/Changes/InvokingTestsAnsible'
license=('MIT')
source=("https://releases.pagure.org/standard-test-roles/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b8746dccfe9cb997d851b6cdf6aeae9740d6e9f489ec3cbed0df896164ac00b43f6d4621d1b8eae43964bfb5b85dc5ca83b7e87c27d959bd764d3cbcb55f6dab')

depends=(
  openssh
  qemu
  python-fmf
)

package() {
  cd "${pkgname}"-${pkgver}

  mkdir -p "${pkgdir}"/usr/share/ansible/roles
  cp -pr roles/* "${pkgdir}"/usr/share/ansible/roles/

  mkdir -p "${pkgdir}"/usr/bin
  for b in merge-standard-inventory str-filter-tests merge-standard-inventory; do
    install -p -m 0755 scripts/${b} "${pkgdir}"/usr/bin/${b}
  done

  mkdir -p "${pkgdir}"/usr/share/ansible/inventory
  cp -p inventory/* "${pkgdir}"/usr/share/ansible/inventory/

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
