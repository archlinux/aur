# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: neko <hi@neko.vg>

pkgname="pounce"
pkgver=3.2
pkgrel=1
pkgdesc="A multi-client, TLS-only IRC bouncer"
arch=(
  'x86_64'
)
url="https://git.causal.agency/pounce/about/"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
  'libretls'
  'libxcrypt'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "https://git.causal.agency/pounce/snapshot/${_pkgsrc}.tar.gz"
)
b2sums=('417e6a2c78a00ad45ce09d9b84021e1afbed299a4dc0120823c4167dbfc1067174ece21798b4e82339b6f71c8616b731620c27ed565207df98c60e7343d2f2a2')

build() {
  local configure_options=(
    --prefix='/usr'
    --bindir='/usr/bin'
    --mandir='/usr/share/man'
    --enable-notify
  )

  cd "${srcdir}/${_pkgsrc}"
  ./configure "${configure_options[@]}"
  make all
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 ./*.7 -t  "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
