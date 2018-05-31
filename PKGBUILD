# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=bluemix-cli
pkgver=0.6.7
pkgrel=2
pkgdesc="Interact with your applications, virtual servers, containers, and other components in IBM Bluemix."
arch=('x86_64' 'i686')
url="http://clis.ng.bluemix.net/ui/home.html"
license=('CUSTOM')
depends=()
source_x86_64=("Bluemix_CLI_${pkgver}_amd64.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux64")
source_i686=("Bluemix_CLI_${pkgver}_386.tar.gz::https://clis.ng.bluemix.net/download/bluemix-cli/${pkgver}/linux32")
sha256sums_x86_64=('552fdaf4b82bf62281e10b7fbfb8a31251f7f1b86144648cb87625d406b1fd19')
sha256sums_i686=('74bf687916eef50c7506541dd0765578bbc5a4dab9125ae371e89689e607f81e')

package() {
  cd "${srcdir}/Bluemix_CLI/"

  mkdir -p "${pkgdir}/opt/Bluemix/"
  install -D "bin/NOTICE" "${pkgdir}/opt/Bluemix/bin/NOTICE"
  install -D "bin/LICENSE" "${pkgdir}/opt/Bluemix/bin/LICENSE"
  install -D "bin/ibmcloud" "${pkgdir}/opt/Bluemix/bin/ibmcloud"
  install -D "bin/bluemix-analytics" "${pkgdir}/opt/Bluemix/bin/bluemix-analytics"
  install -D "bin/cfcli/cf" "${pkgdir}/opt/Bluemix/bin/cfcli/cf"
  install -D "bx/bash_autocomplete" "${pkgdir}/opt/Bluemix/bx/bash_autocomplete"
  install -D "bx/zsh_autocomplete" "${pkgdir}/opt/Bluemix/bx/zsh_autocomplete"

  install -d "${pkgdir}/usr/bin"

  ln -sf /opt/Bluemix/bin/ibmcloud "${pkgdir}/opt/Bluemix/bin/bluemix"
  ln -sf /opt/Bluemix/bin/ibmcloud "${pkgdir}/opt/Bluemix/bin/bx"
  ln -sf /opt/Bluemix/bin/ibmcloud "${pkgdir}/usr/bin/bluemix"
  ln -sf /opt/Bluemix/bin/ibmcloud "${pkgdir}/usr/bin/bx"
  ln -sf /opt/Bluemix/bin/ibmcloud "${pkgdir}/usr/bin/ibmcloud"
  ln -sf /opt/Bluemix/bin/bluemix-analytics "${pkgdir}/usr/bin/bluemix-analytics"

  chown -R root:root "${pkgdir}/opt/Bluemix/"
  chmod -R 755 "${pkgdir}/opt/Bluemix/"

  install -Dm644 "bin/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
