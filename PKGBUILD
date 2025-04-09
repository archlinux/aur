# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Yamashita Ren <lemaitre.lotus@gmail.com>

pkgname="dcadec"
_commit_rel="0e074384c9569e921f8facfe3863912cdb400596" # 0.2.0
_commit="b93deed1a231dd6dd7e39b9fe7d2abe05aa00158" # r30
pkgver="0.2.0+r30+g${_commit::7}"
pkgrel=1
pkgdesc="DTS Coherent Acoustics decoder with support for HD extensions"
arch=('x86_64')
url="https://github.com/foo86/${pkgname}"
license=('LGPL-2.1-or-later')
depends=('glibc')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('6644492588184f55de08f713bfcba6ca444251d1bb868b1a69687bd2b7d416cfda4eed6843cc63eac713971f0717f3c078478ccee9b691aef04d3ed3aedb3b00')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CONFIG_SHARED='TRUE'
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make CONFIG_SHARED='TRUE' DESTDIR="${pkgdir}" PREFIX='/usr' install

  cd "${pkgdir}/usr/bin"
  mv "${pkgname}" "${pkgname}-hd"
}

# vim: ts=2 sw=2 et:
