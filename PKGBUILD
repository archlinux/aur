# Maintainer: Alexandre Berthaud <alexandre at berthaud dot me>

pkgname=clever-arch-test
pkgver=0.10.0
pkgrel=1
pkgdesc="Clever Cloud CLI tool (binary)"
arch=('x86_64')
url="https://github.com/clevercloud/clever-tools"
license=('MIT')

depends=('libcurl-compat'
         'gcc-libs'
         'libnghttp2'
         'libssh2'
         'libpsl')
options=('!strip')
source=("clever-tools-${pkgver}_linux.tar.gz::https://clever-tools.cellar.services.clever-cloud.com/releases/${pkgver}/clever-tools-${pkgver}_linux.tar.gz"
        "clever-wrapper.sh")
sha256sums=('dbacaff787410592f775b23c3a0659e7813b1569c6c7153573fd24f99649ca0a'
            '47e0f16f00d261f3f5919344929a8931e56b7e79ac3919f3d47a64ddd7fe8318')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/linux/nodegit.node" "${pkgdir}/usr/lib/${pkgname}/nodegit.node"
  install "${srcdir}/linux/clever" "${pkgdir}/usr/lib/${pkgname}/clever"
  install "${srcdir}/clever-wrapper.sh" "${pkgdir}/usr/bin/clever"

  "${srcdir}/linux/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/linux/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
