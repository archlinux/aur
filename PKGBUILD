# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=inbucket-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Disposable webmail server (similar to Mailinator) with built in SMTP, POP3, RESTful servers; no DB required"
arch=('x86_64' 'aarch64')
url="https://github.com/inbucket/inbucket"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/inbucket_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/inbucket_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0d7d76ed7e66b0700c38aeef7ad1f086e4a159ce554abd92c95052d0838e0e24')
sha256sums_aarch64=('0d9070eaee5b3f4182d10b9bac7feefbac7762e04cec2484e5679e5ebabd7e68')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="inbucket_${pkgver}_linux_amd64" ;;
    aarch64) _dir="inbucket_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/inbucket" "${pkgdir}/usr/bin/inbucket"
  install -Dm755 "${_dir}/inbucket-client" "${pkgdir}/usr/bin/inbucket-client"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
