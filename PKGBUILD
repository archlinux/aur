# Maintainer: Uffe Jakobsen <microtop_|_at_|_starion_|_dot_|_dk>
# Past maintainer: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=acme-git
_pkgname=acme
pkgver=r74.99fae48
pkgrel=2
pkgdesc="Cross-assembler for MOS 6502, 6510, 4502, 65816, 65C02, 65CE02, R65C02, W65C02 and C64DTV2 CPUs"
arch=('i686' 'x86_64')
url="https://github.com/meonwax/acme"
license=('GPL-2.0-only')
source=('git+https://github.com/meonwax/acme.git')
makedepends=('git')
depends=('glibc')
conflicts=('acme')
provides=('acme')
sha256sums=('SKIP')

pkgver()
{
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_pkgname}/src"
  make || return 1
}

package()
{
  cd "${srcdir}/${_pkgname}/"
  install -D -m755 src/acme ${pkgdir}/usr/bin/acme
  #
  install -D -d ${pkgdir}/usr/share/acme
  cp -R ACME_Lib docs examples "${pkgdir}/usr/share/acme/"
  #
  install -D -d ${pkgdir}/usr/share/doc
  ln -s ../acme/docs "${pkgdir}/usr/share/doc/acme"
}

#
# EOF
#
