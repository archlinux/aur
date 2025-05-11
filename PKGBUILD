# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="imbox"
_commit_rel="be0ecc6cec73dd0a43ed2795a62283de216b4db3" # 1.4
_commit="175f5eb14f9f3f48d3e3ed139603c5726949fac4" # r4
pkgver="1.4+r4+g${_commit::7}"
pkgrel=1
pkgdesc="A small TLS-only IMAP client intended for applying git patches without need of any other mail client"
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/about/"
license=('GPL-3.0-or-later')
depends=('git' 'glibc' 'libretls' 'sh')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::https://git.causal.agency/${pkgname}/snapshot/${_pkgsrc}.tar.gz")
b2sums=('8c1c6c32021ccb47342ea858c0698c2e405148c5d04aaa51ac297ad1262a1daee9f3a0f17817b9bd66fa245b397f0cf0324e879e377872172d74511645be7365')

build() {
  local configure_options=(
    --prefix='/usr'
    # --bindir='/usr/bin'
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
