# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: forivall <forivall@gmail.com>

_pkgbase=hid-azio-lv-mech5
_pkgname=${_pkgbase}-dkms
pkgname=${_pkgname}-git
pkgver=r15.f17482a
pkgrel=3
pkgdesc="Linux dkms kernel module to allow use of extra keys on the Azio Levetron Mech5 Keyboard (azio-levetron-mech5-linux-driver)"
arch=('i686' 'x86_64')
url="http://github.com/forivall/azio-levetron-mech5-linux-driver"
license=('GPL-3.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=('hid-azio-lv-mech5')
source=("${_pkgbase}::git+https://github.com/forivall/azio-levetron-mech5-linux-driver.git"
        "hid-ids.h")
md5sums=('SKIP'
         '0b7c66ac1d363b00f124af748214e413')


pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"

  local rev="$(git rev-parse --short HEAD)"

  # copy sources
  mkdir -p "${pkgdir}/usr/src/"
  cp -r kernel-driver "${pkgdir}/usr/src/${_pkgbase}-$pkgver/"
  cp "${srcdir}/hid-ids.h" "${pkgdir}/usr/src/${_pkgbase}-$pkgver/"

  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  cp misc/90-azio-levetron-mech5.rules "$pkgdir/etc/udev/rules.d/"
}

# vim:set ts=2 sw=2 et:
