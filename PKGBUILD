# Maintainer: Alexandre Berthaud <alexandre at berthaud dot me>

pkgname=clever-tools-bin
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
            'b9180d74661b32aebed117c44cd2afbb157aa9b93374b354a7a45974aaba4eb6')

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -d "${pkgdir}/usr/share/zsh/site-functions"

  install "${srcdir}/nodegit.node" "${pkgdir}/usr/lib/${pkgname}/nodegit.node"
  install "${srcdir}/clever" "${pkgdir}/usr/lib/${pkgname}/clever"
  install "${srcdir}/clever-wrapper.sh" "${pkgdir}/usr/bin/clever"

  "${srcdir}/clever" --bash-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/bash-completion/completions/clever"
  "${srcdir}/clever" --zsh-autocomplete-script /usr/bin/clever > "${pkgdir}/usr/share/zsh/site-functions/_clever"
}
