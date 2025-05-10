# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Evan McCarthy <evan@mccarthy.mn>
# Contributor: neko <hi@neko.vg>

pkgname="pounce"
_commit_rel="2abf0df3017195842c12197de3ea092febf2e60c" # 3.1
_commit="c23e879d060730d6b9484fd7c6554f11ad76b5fa" # r9
pkgver="3.1+r9+g${_commit::7}"
pkgrel=1
pkgdesc="A multi-client, TLS-only IRC bouncer"
arch=('x86_64')
url="https://git.causal.agency/pounce/about/"
license=('GPL-3.0-or-later')
depends=('curl' 'glibc' 'libretls' 'libxcrypt' 'sqlite')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::https://git.causal.agency/pounce/snapshot/${_pkgsrc}.tar.gz")
b2sums=('45e28fdc7aef8d01aaea40e791e6306498a9a22c8f33ea54f0ac397ee016f55204a9680840b37449c6b73a8140bfbb5ce725b7fb59d5dfc0610a8dcb044b141d')

build() {
  local configure_options=(
    --prefix='/usr'
    --bindir='/usr/bin'
    --mandir='/usr/share/man'
    --enable-notify
    --enable-palaver
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
