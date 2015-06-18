# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=ropgadget-git
pkgver=5.4.348.282d851
pkgrel=1
pkgdesc="Search gadgets in binaries to facilitate ROP exploitation for several file formats and architectures"
url="http://www.shell-storm.org/project/ROPgadget"
arch=('any')
license=('GPL2')
depends=('python-capstone')
makedepends=('git' 'python-setuptools')
provides=('ropgadget')
conflicts=('ropgadget')
source=(${pkgname}::git+https://github.com/JonathanSalwan/ROPgadget)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd ${pkgname}/test-suite-binaries
  ./test.sh
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# vim:set ts=2 sw=2 et:
