# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="bubger"
_commit_rel="8aa4c82b81600cccd3d89baf3d489f0b7ef046ea" # 1.1
_commit="80020ae6e39f52dd4147c1d02b50347bed9dc9c3" # r1
pkgver="1.1+r1+g${_commit::7}"
pkgrel=1
pkgdesc="A mailing list archive generator for mail stored in IMAP"
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/about/"
license=('GPL-3.0-or-later')
depends=('glibc' 'libretls')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::https://git.causal.agency/${pkgname}/snapshot/${_pkgsrc}.tar.gz")
b2sums=('34a7f521bed2acbb3a02d22f7fe491ae55b078fb4e9f5d505d9f7cd850eec9dd498235f9109540f28ddaffdb2df8cd559fe108d83226b5f501cddf1847014785')

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
