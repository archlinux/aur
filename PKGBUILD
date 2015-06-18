# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=ropgadget
_pkgname=ROPgadget
pkgver=5.3
pkgrel=3
pkgdesc="Search gadgets in binaries to facilitate ROP exploitation for several file formats and architectures"
url="http://www.shell-storm.org/project/ROPgadget"
arch=('any')
license=('GPL2')
depends=('python2-capstone')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/JonathanSalwan/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('a6eefbf90795192ffe67dbbfdde257e09471995f8fce719d4034576e7240cdbb261060d7be044e6169aedccc8049ec497f05d04e6ce773d92cb894057987fd91')

check() {
  cd ${_pkgname}-${pkgver}
  ./ROPgadget.py --binary ./test-suite-binaries/elf-Linux-x86 --string "main"|grep main
}

package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# vim:set ts=2 sw=2 et:
