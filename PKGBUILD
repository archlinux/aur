# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="COS"
pkgname="${_Name,,}"
_commit_rel="2f6e19ef89efce9779d38e3df492677ab95ccf22" # 0.9
_commit="fc2f3ed275d2291d3fb2499fa3572dcfe3dd9db2" # r116
pkgver="0.9+r116+g${_commit::7}"
pkgrel=1
pkgdesc="Framework that brings C to the level of other high level programming languages and beyond"
arch=('x86_64')
url="https://github.com/CObjectSystem/${_Name}"
license=('Apache-2.0')
depends=('sh' 'glibc')
_pkgsrc="${_Name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${pkgname}_include_stdint.patch")
b2sums=('e44db545e54fd4496f7793edf4e69a20888373907a07ab3025796fad536e22ccef563476ce88654d1df6167d753f6bdb96a57103b8850b2484c3acf6a3163c51'
        '256eafd045d0921106ccd31d7f8ef44bf54f182803315e1dd8d4ee00d79f48608ed9bbc501ed185c2e5060a070f7cf05fa4502129de242d4dee1e20c5052890e')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_include_stdint.patch"

  sed -i 's/$(CCFLAGS)/$(CCFLAGS) $(EXTRA_LDFLAGS)/g' "CosBase/Makefile"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CCFLAGS="${CFLAGS} -fPIC" EXTRA_LDFLAGS="${LDFLAGS}"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make CCFLAGS="${CFLAGS} -fPIC" EXTRA_LDFLAGS="${LDFLAGS}" tests
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make PREFIX="${pkgdir}/usr" install

  # install -vDm644 "CHANGELOG"  "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  # install -vDm644 "CREDITS"    "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
  # install -vDm644 "README"     "${pkgdir}/usr/share/doc/${pkgname}/README"
  # install -vDm644 "README.C89" "${pkgdir}/usr/share/doc/${pkgname}/README.C89"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
