# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="notemap"
_commit_rel="b9eb5766e42b062cc19ddf38070ef8a3fc8da29a" # 1.3
_commit="935f42bb7f0ba0db60de2d09eca501041c46f710" # r2
pkgver="1.3+r2+g${_commit::7}"
pkgrel=1
pkgdesc="Mirrors text files to an IMAP mailbox in a format compatible with the iOS Notes app"
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/about/"
license=('GPL-3.0-or-later')
depends=('git' 'glibc' 'libretls' 'sh')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::https://git.causal.agency/${pkgname}/snapshot/${_pkgsrc}.tar.gz")
b2sums=('458444e02ecc576e9dd2c993d265fe4804accab091d52b2112e9abc9c5bae058d9ba06c7fe9c0cbf81e2c67219dc3b07866520c7b3c17b3116938fef7d652ba4')

build() {
  local configure_options=(
    --prefix='/usr'
    --bindir='/usr/bin'
    --mandir='/usr/share/man'
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
