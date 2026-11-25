# Maintainer: Clément Nussbaumer <clement at n8r dot ch>

pkgname=kubesess-bin
_pkgname=kubesess
pkgver=3.0.0
# upstream tags aren't always the bare version (e.g. 2.0.3-1)
_tag=${pkgver}
pkgrel=1
pkgdesc='Per-shell kubectl context and namespace switching'
arch=('x86_64' 'aarch64')
url='https://github.com/Ramilito/kubesess'
license=('MIT')
optdepends=('kubectl: the client whose context kubesess manages')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# ship upstream's binary byte-for-byte; it carries no debug info
options=('!strip' '!debug')
_rel="${url}/releases/download/${_tag}/${_pkgname}_${_tag}"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Ramilito/kubesess/${_tag}/LICENSE")
# musl builds are static: no breakage on glibc updates
source_x86_64=("${_rel}_x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_rel}_aarch64-unknown-linux-musl.tar.gz")
sha256sums=('5c03e6e98ee7f0c7f2ddf507477fb364797fa4dc026fb7e4649ac49909fe582a')
sha256sums_x86_64=('667384aa558637cfdf0791497cdb0693a539c73d62fab2d1db980fdb96f39c80')
sha256sums_aarch64=('87893c99f2ba88a7d036b2bec20c129c7b7625f99573dfbffb16d85d5a08d27e')

package() {
  install -Dm755 "target/${CARCH}-unknown-linux-musl/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
