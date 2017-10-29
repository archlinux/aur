# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor zlowly <zlowly AT  gmail DOT com>

_pkgname=ipad_charge
pkgname=${_pkgname}-git
pkgver=r53.aef5d59
pkgrel=1
pkgdesc="iPad USB charging control utility"
arch=("i686" "x86_64")
url="http://www.rainbow-software.org/linux/"
license=('GPL2')
provides=('ipad_charge')
conflicts=('ipad_charge')
source=("git+https://github.com/mkorenkov/ipad_charge")
md5sums=('SKIP')
depends=('udev' 'libusb')
makedepends=('gcc')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  cd "${srcdir}/${_pkgname}"
  install -m755 -s ipad_charge "${pkgdir}/usr/bin/"
  install -m644 95-ipad_charge.rules "${pkgdir}/etc/udev/rules.d/"
}

# vim:set ts=2 sw=2 et:
